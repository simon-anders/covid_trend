all: covid.html covid_plotly.html covid_de.html

refresh:
	make time_series_19-covid-Confirmed.csv
	make all

clean:
	rm -f covid.html covid_plotly.html covid_plotly_pre.html make_plotly.Rout time_series_19-covid-Confirmed.csv
	rm -rf covid_plotly_pre_files/

time_series_19-covid-Confirmed.csv:
	wget https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv

covid.html: page.md
	pandoc -s page.md >covid.html

covid_de.html: page_de.md
	pandoc -s page_de.md >covid_de.html

covid_plotly_pre.html: make_plotly.R time_series_19-covid-Confirmed.csv
	R CMD BATCH make_plotly.R

covid_plotly.html: covid_plotly_pre.html
	cat covid_plotly_pre.html | \
	  sed -e 's/"padding":40/"padding":0/' > \
	  sed -e 's|covid_plotly_files/plotly-main-1.49.4/plotly-latest.min.js|https://cdn.plot.ly/plotly-1.49.4.min.js|' > \
	  covid_plotly.html
