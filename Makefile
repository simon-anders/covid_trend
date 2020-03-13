all: covid.html covid_plotly.html

clean:
	rm -f covid.html covid_plotly.html

covid.html: page.md
	pandoc -s page.md >covid.html

covid_plotly.html: make_plotly.R
	R CMD BATCH make_plotly.R 
