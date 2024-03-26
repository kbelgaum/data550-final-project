# DATA 550 Final Project

------------------------------------------------------------------------

## Generating final report

Final report should be generated executing `make`. The rule in the makefile
used to do this is titled "FPreport.html"

## Pieces of code used

`code/01_make_table.R`

  - loads Pima Indian Diabetes dataset
  - creates table 1 with summary statistics
  - saves table as a `.rds` object in `output/` folder

`code/02_render_report.R`

  - renders `FPreport.Rmd`

`report.Rmd`

  - reads table generated by `code/01_make_table.R`
  - makes histogram from loaded dataset

------------------------------------------------------------------------