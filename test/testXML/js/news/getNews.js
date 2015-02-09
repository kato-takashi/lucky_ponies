// JavaScript Document
$(function(){
	$.ajax({
    url: 'xml/news/news.xml',
    type: 'GET',
    dataType: ($.browser.msie) ? "text" : "xml",
	timeout: 2500,
	async: true,
    cache: false,
    
    
	error: function(){
        alert("xmlファイルの読み込みに失敗しました");
    },
    success: function(xml){
		var xmldata;
		///////ie用
        if (typeof xml == "string") {
			//alert("ieで開始");
                    xmldata = new ActiveXObject("Microsoft.XMLDOM");
                    xmldata.async = true;
                    xmldata.loadXML(xml);
			
			$(xmldata).find("row").each(function(){
			var ie_item_text = $(this).text();
			var ie_day_txt = $(this).find("day").text();
			var ie_content_txt = $(this).find("content").text();
			var ie_url_txt = $(this).find("url").text(); 
			//alert(ie_day_txt+"ie");
			
				$(('<a href="'+ie_url_txt+'"></a>'))
                .html(ie_day_txt+"│"+ie_content_txt)
                .appendTo('ul.news_li');
				
			});
			$("ul.news_li li").html("HOT news");
			$("ul.news_li a").wrap("<li></li>");
			////////
			function include(astrFile)
		{
		　　var script = document.createElement('script');
		　　script.src = astrFile;
		　　script.type = 'text/javascript';
		　　script.defer = true;
		　　document.getElementsByTagName('head').item(0).appendChild(script);
		}
		include('js/execute/news.js');
			/////////
			
                } else {
                    xmldata = xml;
		
		//alert("その他ブラウザで開始");
        $(xml).find("row").each(function(){
            var item_text = $(this).text();
			var day_txt = $(this).find("day").text();
			var content_txt = $(this).find("content").text();
			var url_txt = $(this).find("url").text(); 

          $('<a href="'+url_txt+'"></a>')
		  //$('<li></li>')
                /////オリジナル
				//.html(day_txt+"│"+content_txt)
                //.appendTo('ul.stockTicker');
				/////オリジナル
				.html(day_txt+"│"+content_txt)
                .appendTo('ul.news_li');
				
				
			
	    });
        $("ul.news_li li").html("HOT news");
		$("ul.news_li a").wrap("<li></li>");
		//$("li").wrap("<a></a>");
		//alert("getText");
		/*document.write("<script type='text/javascript' src='jquery.innerfade.js'></script>");
		document.write("<script type='text/javascript' src='news.js'></script>");
		*/
		function include(astrFile)
		{
		　　var script = document.createElement('script');
		　　script.src = astrFile;
		　　script.type = 'text/javascript';
		　　script.defer = true;
		　　document.getElementsByTagName('head').item(0).appendChild(script);
		}
		include('js/execute/news.js');
				
			}
			}/////if終了
			});
});



