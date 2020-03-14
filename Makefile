all: covid.html covid_plotly.html covid_de.html

clean:
	rm -f covid.html covid_plotly.html covid_plotly.pre.html covid_de.html

covid.html: page.md
	pandoc -s page.md >covid.html

covid_de.html: page_de.md
	pandoc -s page_de.md >covid_de.html

covid_plotly_pre.html: make_plotly.R
	R CMD BATCH make_plotly.R 

covid_plotly.html: covid_plotly_pre.html
	cat covid_plotly_pre.html | \
	  sed -e 's/"padding":40/"padding":0/' | \
	  sed -e 's|covid_plotly_files/plotly-main-1.49.4/plotly-latest.min.js|https://cdn.plot.ly/plotly-1.49.4.min.js|' > \
	  covid_plotly.html
