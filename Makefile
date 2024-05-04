FPreport.html: FPreport.Rmd code/02_render_report.R table1
	Rscript code/02_render_report.R

table1:
	Rscript code/01_make_table.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f FPreport.html

.PHONY: install	
install: 
	Rscript -e "renv::restore(prompt=FALSE)"
	
# DOCKER ASSOCIATED RULES (on local machine)
PROJECTFILES = FPreport.Rmd code/01_make_table.R code/02_render_report.R Makefile
RENV = renv.lock renv/activate.R renv/settings.dcf

# rule to build image
project_image: $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image
	touch $@
	
# rule to build report automatically in container
final_project/FPreprt.html: project_image
	docker run -v "/$$(pwd)/final_project":/project/final_project project_image
