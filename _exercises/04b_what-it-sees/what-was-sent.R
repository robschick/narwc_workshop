# What did the assistant send to the model? -----------------------------------
# Posit Assistant keeps its own record of each conversation in
# ~/.posit/assistant/workspaces/. This reads the most recent conversation for
# this project and lists everything that went back to the model: the output of
# each piece of code it ran, each file it read, and each image you attached.
#
# It is the assistant's record of what it sent, not a capture of the network
# traffic, so parts such as the system prompt may be missing.
#
# Usage:
#   source(here::here("_exercises/04b_what-it-sees/what-was-sent.R"))
#   sent <- what_was_sent()
#   sent                       # one row per thing sent, with its size
#   show_sent(sent)            # the first few lines of each

what_was_sent <- function(project = here::here(), conversation = 1) {
  root <- path.expand("~/.posit/assistant/workspaces")
  ws <- list.files(root, full.names = TRUE)
  ws <- ws[file.exists(file.path(ws, "workspace.json"))]
  paths <- vapply(ws, \(w) jsonlite::read_json(file.path(w, "workspace.json"))$path, "")
  ws <- ws[normalizePath(paths, mustWork = FALSE) == normalizePath(project)]
  if (length(ws) == 0) stop("No Posit Assistant conversations found for ", project)

  logs <- list.files(ws, "^lm-messages\\.jsonl$", recursive = TRUE, full.names = TRUE)
  logs <- logs[order(file.mtime(logs), decreasing = TRUE)]
  log <- logs[conversation]

  msgs <- lapply(readLines(log, warn = FALSE), \(l) jsonlite::fromJSON(l, simplifyVector = FALSE)$message)
  parts <- unlist(lapply(msgs, \(m) if (is.list(m$content)) m$content), recursive = FALSE)

  calls <- Filter(\(p) identical(p$type, "tool-call"), parts)
  asked <- setNames(
    vapply(calls, \(p) as.character(p$input$code %||% p$input$file_path %||%
                                      p$input$command %||% p$input$url %||% ""), ""),
    vapply(calls, \(p) p$toolCallId, "")
  )

  sent <- Filter(\(p) p$type %in% c("tool-result", "image"), parts)
  out <- tibble::tibble(
    what = vapply(sent, \(p) if (p$type == "image") "image you attached" else p$toolName, ""),
    asked_for = vapply(sent, \(p) if (p$type == "image") "" else asked[p$toolCallId] |> unname() |> coalesce_na(), ""),
    sent = vapply(sent, \(p) result_text(p), "")
  )
  out$chars <- vapply(sent, \(p) if (p$type == "image") nchar(p$image) else nchar(result_text(p)), 1L)
  attr(out, "log") <- log
  out
}

coalesce_na <- function(x) if (is.na(x)) "" else x

result_text <- function(p) {
  if (p$type == "image") return(sprintf("[%s, sent as base64 text]", p$mediaType))
  v <- p$output$value
  if (is.character(v)) return(v)
  paste(vapply(v, \(x) x$text %||% paste0("[", x$type, "]"), ""), collapse = "\n")
}

show_sent <- function(sent, n_lines = 4) {
  for (i in seq_len(nrow(sent))) {
    lines <- strsplit(sent$sent[i], "\n", fixed = TRUE)[[1]]
    writeLines(c(
      sprintf("── %d. %s (%s characters)", i, sent$what[i], format(sent$chars[i], big.mark = ",")),
      if (nzchar(sent$asked_for[i])) paste("   asked for:", strsplit(sent$asked_for[i], "\n")[[1]][1]),
      paste("  ", head(lines, n_lines)),
      if (length(lines) > n_lines) sprintf("   … %d more lines", length(lines) - n_lines),
      ""
    ))
  }
  invisible(sent)
}
