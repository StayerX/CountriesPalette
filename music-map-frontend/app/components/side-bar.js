import Ember from 'ember';

export default Ember.Component.extend({

  formattedCountryName: Ember.computed('countryName', function() {
    var name = this.get('countryName');
    if (name) {
      return name;
    } else {
      return "Country Not Found";
    }
  }),

  formattedPopulation: Ember.computed('population', function() {
    var pop = this.get('population');
    if (pop) {
      return pop;
    } else {
      return "N/A";
    }
  }),

  formattedTwitter: Ember.computed('countryName', function() {
    	 !function(d,s,id){
    		var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
    		if(!d.getElementById(id)){
    			js=d.createElement(s);
    			js.id=id;js.src=p+"://platform.twitter.com/widgets.js";
    			fjs.parentNode.insertBefore(js,fjs);}
    	}(document,"script","twitter-wjs");


     	var first = "<div id='twitter'><a class='twitter-timeline' href='https://twitter.com/search?q=%23{{countryName}}' data-widget-id='668277065687265280' data-screen-name="
     	var last = "data-chrome='transparent'height='400'>Tweets from {{countryName}}</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');</script></div>"
			var combined = first + this.get('countryName') + last;

			$("#info").append(combined);

			if(window.twttr)
				window.twttr.widgets.load();

			$("#twitter").remove();
			//$("#info").load(location.href + combined);
    	//$("#twitter-info").append("<div id='twitter'><a class='twitter-timeline' href='https://twitter.com/search?q=%23{{countryName}}' data-widget-id='668277065687265280' data-screen-name=" + this.get('countryName') + "data-chrome='transparent'height='400'>Tweets from {{countryName}}</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');</script></div>")


  		//var iframe = document.getElementById("twitter-widget-0");
			//iframe.src = iframe.src;
			return this.get('countryName');
  }),
});
