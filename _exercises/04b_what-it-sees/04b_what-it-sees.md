# Exercise 04b — What the assistant sees

**Time:** 13 minutes, after exercise 04. **Tool:** the Posit Assistant pane.

In exercise 04 the assistant worked in your R session. It could see `calls`,
run code on it and read the results. Anything it reads goes to the model
provider. This exercise finds out what that was, and then tries working
without sending the data at all.

## Part 1 — Ask what it saw, then check (5 min)

Stay in your exercise 04 chat and ask:

> What have you seen of `calls`? List the columns, how many rows, and any
> actual values you've seen.

Then:

> Which of those did you read by running code, and which did I show you?

Now check its answer against its own record. Run this in the console:

```r
source(here::here("_exercises/04b_what-it-sees/what-was-sent.R"))
sent <- what_was_sent()
sent             # one row per thing it sent back to the model, with its size
show_sent(sent)  # the first few lines of each
```

Every row is something that left your machine: the output of code it ran,
a file it read, an image you attached. Does it match what the assistant told
you? Compare both with what you'd be allowed to share if these were embargoed
data, or data under a permit or a data-sharing agreement.

## Part 2 — The dictionary, not the data (8 min)

1. Restart R (**Session → Restart R**) and don't load the data. `ls()` should
   be empty.
2. Set the assistant to ask before it runs anything (the approval setting
   under the chat box). If it asks to run code or read a file, say no.
3. Start a **new chat**, type `@`, attach `data/data-dict.yaml`, and send:

   > Using only this data dictionary, without reading or running anything,
   > write the code to plot detections per hour of day, in local time,
   > faceted by day.

4. Read the code before you run it. Did it convert to local time the way the
   dictionary says to? Did it try to open the data anyway?
5. Now run it yourself, and compare the plot with your exercise 04 version.
   Then run `show_sent(what_was_sent())` again. This chat's rows should be
   the dictionary and nothing from `calls`.

The dictionary only protects you if the assistant can't reach the file.
Here the data sit in the project, so one approved code run would read them.
In your own work, think about where the data live, not just what you type.

## If you have time — write one

Open `my-dictionary.yaml` in this folder and describe a table of your own,
or the hourly counts you made in exercise 04. Then start a new chat, attach
only that file, and ask for one plot or summary. Is your description enough
for it to get the code right? What did you have to add?

## Note what happened

In `_exercises/04b_what-it-sees/notes.md`, next to this file, record what it
said it had seen, and anything that surprised you.
