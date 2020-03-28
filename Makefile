all: covid.html covid_plotly.html covid_de.html covid_fr.html

refresh:
	rm time_series_covid19_confirmed_global.csv
	make all

clean:
	rm -f covid.html covid_plotly.html covid_plotly_pre.html make_plotly.Rout time_series_19-covid-Confirmed.csv time_series_covid19_confirmed_global
	rm -rf covid_plotly_pre_files/

time_series_covid19_confirmed_global.csv:
	wget https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv

covid.html: page.md
	pandoc -s page.md >covid.html

covid_de.html: page_de.md
	pandoc -s page_de.md >covid_de.html

covid_fr.html: page_fr.md
	pandoc -s page_fr.md >covid_fr.html

covid_plotly_pre.html: make_plotly.R time_series_covid19_confirmed_global
	R CMD BATCH make_plotly.R

covid_plotly.html: covid_plotly_pre.html toggle_traces.js
	cat covid_plotly_pre.html | \
	  sed -e 's/"padding":40/"padding":0/' > \
	  sed -e 's|covid_plotly_files/plotly-main-1.49.4/plotly-latest.min.js|https://cdn.plot.ly/plotly-1.49.4.min.js|' > \
	  sed -e 's|</body>|<script src="toggle_traces.js"></script>\n</body>|' > \
	  covid_plotly.html
