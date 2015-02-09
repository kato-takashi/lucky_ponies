// JavaScript Document
$(function() {
	var num = 1;
	$('#nav1 li a')
	//マウスオーバー画像を配置
	.each(function(){
		//$(this).css('background', 'transparent url(./images/temp/btn/nav/nav0'+num+'.gif) no-repeat 0px -29px');
		//num++;
		$(this).css('background', 'transparent url(./images/temp/btn/nav/navi_btn01_0'+num+'.gif) no-repeat 0px -28px');
		num++;

		
	})
	.find('img').hover(
		function(){  
			$(this).stop().animate({'opacity' : '0'}, 500);  
		},
		function(){
			$(this).stop().animate({'opacity' : '1'}, 1000);
		}
	); 
});
