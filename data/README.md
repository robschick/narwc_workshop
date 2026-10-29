# Data

`narw_upcalls.rds` is the one dataset for the whole workshop: 8,256 right
whale up-call detections from a single recorder in Stellwagen Bank, 28 March to
3 April 2009 (DCLDE 2013, NOAA NCEI; public).

```r
calls <- readRDS(here::here("data/narw_upcalls.rds"))
```

**Read `data-dict.yaml` before you analyse anything.** It is a
[data-dict](https://data-dict.tidyverse.org/) dictionary: what each column
means, and what in the data needs a decision from you. In short:

- `time` is shown in UTC. The recorder's local time is 5 hours behind.
- Rows are in log order, not time order.
- 28% of calls are `Possibly_Detected`.
- Five pairs of rows share a start time.

The data are deliberately left like this. Spotting these issues is part of the
exercises.

| File | What it is |
|---|---|
| `raw/…upcall-detection-log.csv` | The detection log as published |
| `build_narw_upcalls.R` | Builds the `.rds` from the raw log |
| `narw_upcalls.rds` | What the exercises read |
| `data-dict.yaml` | The data dictionary |
