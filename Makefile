FPreport.html: FPreport.Rmd code/02_render_report.R table1
	Rscript code/02_render_report.R

table1:
	Rscript code/01_make_table.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f FPreport.html