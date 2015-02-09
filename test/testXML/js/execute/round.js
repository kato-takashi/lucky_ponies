// JavaScript Document
	$(function(){ 
	settings = {
          tl: { radius: 20 },
          tr: { radius: 20 },
          bl: { radius: 20 },
          br: { radius: 20 },
		 antiAlias: false,
          autoPad: true,
          validTags: ["div"]
      }
	  
	$('div#top').corner(settings);
	$('div#main').corner(settings);
	});