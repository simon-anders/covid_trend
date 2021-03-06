<style>
   a { text-decoration: none; }
</style>
<div style="max-width:850px">
\[ *![](https://cdn1.iconfinder.com/data/icons/stripe-flag-set/23/US.png) English* | *[ ![](https://cdn1.iconfinder.com/data/icons/stripe-flag-set/23/DE.png) Deutsch ](covid_de.html)* | *[ ![](https://cdn1.iconfinder.com/data/icons/stripe-flag-set/23/FR.png) Français ](covid_fr.html)* ]

## Covid19

Increase of the number of confirmed Covid19 cases over the last few weeks:

<iframe src="covid_plotly.html" width=1000 height=500 style="border:none;padding:none"></iframe>

This chart helps understand how dramatic exponential growth can be:

- The diagonal gray lines indicate exponential growth with a **10-fold increase every week**.
- Click on country names to see their traces
- Observe that the gray lines match quite closely the trend for many countries.
- Use the gray lines as guide to look ahead for a few days: Where is your country heading? When will it be where Italy is now?
- Remeber: These are only confirmed cases. There might be many more, especially if a country does not test enough.

- Move your mouse over the coloured lines to read of indidual values.


<p style="margin-bottom:50px;"></p>

---

<p style="margin-bottom:100px;"></p>

How worried should we be? Here is my very personal opinion: (written 14 Mar 2020)

- It's the older, the sick, weak or frail people who are at serious risk of dying. So, if you are, like me, healthy and not old, you might not worry too much **about youself**. 

- Remember, **however:** If you get infected, you will be contagious days before you notice. In that time you might infect others, and they might get much more seriously ill than you.

- And if we cannot slow down this exponential growth, hospitals will be overwhelmed and  will not manage to treat those who get really sick. They will die. In Italy, this is already happing.

So: We need to take this pandemic serious, if not for our own sake, then for sake of the those weaker than us. This is not the time to be selfish.

How long will this go on?

- I'm not an epidemiologist, just a data scientist, so I wouldn't know. All the data shows us is that for some countries, the rate is much slower and becomes shallower every day. Maybe they are doing something right, maybe they are already hitting the limit of all exposes people having met the virus. Better listen to actual experts on this crucial question.

- Watch 3blue1brown's [video](https://www.youtube.com/watch?v=Kas0tIxDvrg]) if you want to learn more about the mathematics of exponential growth, and why it never goes on forever.

Technical notes:

- The data is taken from the time series of confirmed cases at [this page](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series). This data is collected by the Johns Hopkins University Center for Systems Science and Engineering ([JHU CSSE](https://systems.jhu.edu/)), who collect data from [various sources](https://github.com/CSSEGISandData/COVID-19) and update their table daily. They also offer [their own information "dashboard"](https://systems.jhu.edu/research/public-health/ncov/).
- To reduce clutter, only countries with more than 1000 cases are shown, and only from 24 Feb on. JHU CSSE has more complete information.
- This page was written by <a href="https://twitter.com/s_anders_m">Simon Anders</a> in Heidelberg. I am a physicist and data scientist, and not an epidemiologist, so I tried to sray not too far from merely presenting the raw numbers and repeating general advice.
- Source code <a href="https://github.com/simon-anders/covid_trend">on GitHub.

</div>

<!-- Default Statcounter code for papagei
http://www.papagei.zmbh.uni-heidelberg.de -->
<script type="text/javascript">
var sc_project=12217842; 
var sc_invisible=1; 
var sc_security="e8a77c88"; 
</script>
<script type="text/javascript"
src="https://www.statcounter.com/counter/counter.js"
async></script>
<noscript><div class="statcounter"><a title="Web Analytics"
href="https://statcounter.com/" target="_blank"><img
class="statcounter"
src="https://c.statcounter.com/12217842/0/e8a77c88/1/"
alt="Web Analytics"></a></div></noscript>
<!-- End of Statcounter Code -->
