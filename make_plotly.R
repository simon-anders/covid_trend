library( tidyverse )
library( ggplot2 )

read_csv( "time_series_19-covid-Confirmed.csv" ) -> raw_data

# Make the palette
seq( 0, by=.211, length.out=300 ) -> a
hsv( a - floor(a), 1, .85 ) -> palette

# Clean the data:
read_csv(jhu_url) %>%
# Select columns
select( -`Province/State`, -Lat, -Long ) %>%
gather( date, count, -`Country/Region` ) %>%
rename( region = `Country/Region` ) %>%
# Parse dates
mutate_at( "date", as.Date, "%m/%d/%y" ) %>%
# Sum over subregions
group_by( region, date ) %>%
summarise_at( "count", sum ) %>%
# Filter out small values
filter( count>0, max(count) > 300 ) %>%
# Filter out old data
filter( date >= as.Date("2020-02-17") ) %>%
filter( region != "Cruise Ship") %>%
ungroup -> main_data

# Order country by number of case today
main_data %>%
filter( date==max(date) ) %>%
arrange(count) %>%
pull(region) -> countries_sorted

# Make slopelines
mondays <- seq( as.Date("2020-01-13"), as.Date(Sys.time())+14, by=7 )
tibble(
  startdate = mondays,
  startcount = 10 ) %>%
mutate( enddate = max(main_data$date) + 14 ) %>%
mutate( endcount = ( 10 ^ (as.integer(enddate-startdate)/7) ) * startcount ) %>%
mutate( idx = row_number() ) -> aa

bind_rows(
aa %>% select( idx, date=startdate, count=startcount ),
aa %>% select( idx, date=enddate, count=endcount ) ) -> slopelines

map_dfr( -12:12, .id="shift", function(i)
   tibble( date = mondays, count = 10^((0:10)+i) ) ) -> slopelines

main_data %>%
mutate_at( "region", factor, levels=rev(countries_sorted) ) %>%
ggplot( aes( x=date, y=count ) ) +
scale_x_date( breaks = mondays, date_labels = "%a %d. %b", 
  limits = as.Date( c(  mondays[6], mondays[11] ) ) ) +
scale_y_log10( limits=c(7,1e5),
  breaks = 10^(1:5), labels=c("10", "100", "1000", "10,000", "100,000" ) )+
geom_line( aes( group=shift ), col="gray", data = slopelines ) +
geom_line( aes( col=region ) ) +
scale_color_manual( values=palette ) +
ylab( "confirmed cases" ) +
ggtitle( "COVID-19" ) +
theme_bw() -> plot

htmlwidgets::saveWidget( 
  widget = 
    plotly::ggplotly( plot, width=800, height=450 ) %>%
    plotly::config(displayModeBar = F) %>% 
    plotly::layout(xaxis=list(fixedrange=TRUE)) %>% 
    plotly::layout(yaxis=list(fixedrange=TRUE)), 
  file = "covid_plotly_pre.html",
  selfcontained = FALSE,
  title = "COVID 19 cases" )
