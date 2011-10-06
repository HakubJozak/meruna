var actualSlide=1;

window.addEvent('domready',function(){
	var listOfSlides=$$("#slideShow .sl");
	listOfSlides.each(function(element){element.setStyles({'opacity':0})});

	if($('leftArrow'))$('leftArrow').addEvent('click',function(){changeSlide(actualSlide-1)});
	if($('rightArrow'))$('rightArrow').addEvent('click',function(){changeSlide(actualSlide+1)});

	function changeSlide(slideNumber){
		if(slideNumber <= 0)slideNumber=listOfSlides.length;	
		if(slideNumber > listOfSlides.length)slideNumber=1;
	
		$('slide'+actualSlide).fade(0);
		actualSlide=slideNumber;
		$('slide'+actualSlide).fade(1);

		$('slide'+actualSlide+'l').tween('margin-top', [60,80])
		
	}

	if($('slideShow'))changeSlide(actualSlide);


	var listOfSubmenuItems=$$('#submenu a img');
	listOfSubmenuItems.each(function(element){
		
		if(element.className=="act"){
			element.src=element.src.replace(".gif","-hover.gif");
		}else{
			element.addEvent('mouseenter',function(){
				this.src=this.src.replace(".gif","-hover.gif");
			});
			element.addEvent('mouseleave',function(){
				this.src=this.src.replace("-hover.gif",".gif");
			});
		}
	});


});



