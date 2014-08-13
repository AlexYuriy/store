$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#s_num_prud').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
	
// обеспечивает работу бокового меню sidebar

    var id_menu = new Array('other_links', 'categories', 'cart');
    var id_sidebar_right_space = "id_sidebar_right_space";
    var for_scroll = new Array('sidebar', 'other_links', id_sidebar_right_space, 'categories', 'cart');
    var y_coord; // сохроняет координат при перемотке вверх
    var widthSidebarItem = 80;	// ширина элемента бокового меню

    // открыть элемент меню закрыв другие элементы
    function openMenu(id){
	    for (i=0; i < id_menu.length; i++){
		    if (id != id_menu[i]){
			    document.getElementById(id_menu[i]).style.display = "none";
		    }
	    }
	    if (document.getElementById(id).style.display == "block"){
		    document.getElementById(id).style.display = "none";
		    document.getElementById(id_sidebar_right_space).style.display = "none";
	    }else{
		    document.getElementById(id).style.display = "block";
		    document.getElementById(id_sidebar_right_space).style.display = "block";
	    }	
    }

    // закрыть элемент меню
    function closeMenu(id){
        for (var i = 0; i < id_menu.length; i++){
            document.getElementById(id_menu[i]).style.display = "none";
            document.getElementById(id_sidebar_right_space).style.display = "none";
        } 
    }

    // меню всегда слева на весь экран
    function moveMenuScreen(){  
        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;    
     //   obj.style.left = (document.body.clientWidth / 2 - obj.clientWidth / 2 + document.body.scrollLeft) + 'px';  
        for (var i = 0; i < for_scroll.length; i++){
            var obj = document.getElementById(for_scroll[i]);
            obj.style.top = scrollTop + 'px';  
        }
    }  

    // перематывает вверх 
    function scrollToTop(){
        y_coord = window.pageYOffset || document.documentElement.scrollTop;
	var y = y_coord;
	
	// обеспечивает плавную перемотку
	var interval = setInterval(function(){
	  window.scrollBy(0, -60);
	  y -= 60;
	  if (y < 60) {
	    window.scrollTo(0, 0);
	    
	    document.getElementById('temp_scroll_item').style.display = "none";
	    document.getElementById('scroll_to_top').style.display = "none";
	    document.getElementById('scroll_to_bottom').style.display = "block";
	    clearInterval(interval);}
	}, 20);
	
        
    }

    // перематывает вниз после перемотки вверх
    function scrollToBottom(){
      var y = 0;      
     
	// обеспечивает плавную перемотку
        var interval = setInterval(function(){
	  window.scrollBy(0, 60);
	  y += 60;
	  if (y > y_coord - 60) {
	    window.scrollTo(0, y_coord);
	    
	    document.getElementById('temp_scroll_item').style.display = "none";
	    document.getElementById('scroll_to_bottom').style.display = "none";
	    document.getElementById('scroll_to_top').style.display = "block";
	    clearInterval(interval);
	  }
	}, 20);        
    }

    // управляет элементом перемотки
    // отображает необходимый элемент при перемотки
    function displayScrollItem(){
        var coord = window.pageYOffset || document.documentElement.scrollTop;
        
        if (coord > 100){
            document.getElementById('scroll_to_bottom').style.display = "none";
            document.getElementById('scroll_to_top').style.display = "block";
            document.getElementById('temp_scroll_item').style.display = "none";
        }
        else {
            document.getElementById('scroll_to_top').style.display = "none";
            if (document.getElementById('scroll_to_bottom').style.display == "none" &&
                document.getElementById('scroll_to_top').style.display == "none")
            {
                document.getElementById('temp_scroll_item').style.display = "block";
            }
        }
    }
    
    // рассчитывает размер бокового меню. Вызывать при открытии страницы и изменении размера окна
    function calc_sidebar_meter(){
	var windowHeight = window.innerHeight;
	var heightScrollItem = Math.ceil(windowHeight - 4 * widthSidebarItem - 3);
	var margin_top_img = Math.ceil(heightScrollItem / 2 - 40); // отступ изображения от верха полосы прокрутки
	
	if (heightScrollItem < 80) heightScrollItem = 80;
	
	document.getElementById('scroll_to_bottom').style.height = heightScrollItem + "px";
        document.getElementById('scroll_to_top').style.height = heightScrollItem + "px";
        document.getElementById('temp_scroll_item').style.height = heightScrollItem + "px";
	
	document.getElementById('temp_scroll_img').style.marginTop = margin_top_img + "px";
	document.getElementById('scroll_to_bottom_img').style.marginTop = margin_top_img + "px";
        document.getElementById('scroll_to_top_img').style.marginTop = margin_top_img + "px";
    }
    
    // находит все элементы по имени класса
    // функция тяжёлая, не увлекаться с использованием
    function getElementByClassName (class_name){
		// Получим коллекцию элементов тега body:
		var elements = document.body.getElementsByTagName("*"),
		    length   = elements.length,
		    out = [], i;
	
		// Пройдёмся по ним... увы циклом:
		for (i = 0; i < length; i += 1) {
	
		    // Поместим в результирующий массив элементы, содержащие требуемый класс:
		    if (elements[i].className.indexOf(class_name) !== -1) {
			out.push(elements[i]);
		    }       
		}        
		return out;
    };
    


// печать списка товаров
    function print_cart(){
	// элементы, которые необходимо распечатать
	var forPrintClass = new Array('cart-info', 'cart-module', 'cart-total', 'warning', 'content');
	var forPrintId = new Array('container', 'content');
      
	// Получим коллекцию элементов тега body:
	var elements = document.body.getElementsByTagName("div");
	var length   = elements.length;
	var lengthForPrint = forPrintClass.length;
	var out = [], i, j, k;
	var notShow = new Array();
	var print;	// печатать ли элемент
	
	// если этот элемент не подлежит печати - убираем со страницы
	for (i = 0; i < length; i += 1) {
	    print = false;
	    
	    // запоминаем элементы, которые не надо печатать
	    if (elements[i].style.display == "none") {
// 		alert(elements[i].className);
		notShow[notShow.length] = elements[i];
		continue;
	    }
	    
	    // поиск по классу
	    for (j = 0; j < lengthForPrint; j++){
		 if (elements[i].className == forPrintClass[j]) {
		    print = true;
		    continue;
		 }		 
	    }
	    
	    // поиск по id
	    for (j = 0; j < lengthForPrint; j++){
		if (elements[i].id == forPrintId[j] || print){
		    print = true;
		    continue;
		}
	    }
	    
	    if (print) elements[i].style.display = "block";
	    else elements[i].style.display = "none";
	}
	
	// печать
	window.print();
	
	// 
	alert('Print success');
	
	location.reload();
	
	
    };
    
    function printDoc(forPrintId){
	
	document.getElementById('main_sidebar').style.display = "none";
	document.getElementById('container').style.display = "none";
	
	$("#" + forPrintId).clone()        		// сделаем копию элемента
	.addClass("newElement")         // добавим этой копии класс newElement
	.appendTo("#printDiv");        // вставим измененный элемент в конец элемента printDiv
	
	document.getElementById('printDiv').style.display = "block";
	
	window.print();
	
	document.getElementById('printDiv').style.display = "none";
	
	document.getElementById('main_sidebar').style.display = "block";
	document.getElementById('container').style.display = "block";
    }