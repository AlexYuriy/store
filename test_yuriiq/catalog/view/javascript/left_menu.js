// обеспечивает работу бокового меню sidebar
    var y_coord; // сохроняет координат при перемотке вверх
	var id_open = new Array(); // Массив открытых элементов
    // открыть элемент меню закрыв другие элементы
    function openMenu(id, close){
		var elem = document.getElementById(id);
	    if (elem.style.display == "block") {
			if (close) {
				closeMenu();
			}
			else {
				elem.style.display = "none";
				for (i=0; i < id_open.length; ++i) 	
					if (id_open[i] == elem)  id_open.splice(i,1);			
			}
	    } else {
		    if (close) closeMenu();
		    elem.style.display = "block";    
			document.getElementById('sidebar_right_space').style.display = "block";
			id_open.push (elem);
	    }	
    }
	//
	function closeMenu(id) {
		
		if (!id) {
			for (i=0; i < id_open.length; ++i) {
				id_open[i].style.display = "none";
			}
			id_open.length = 0;
			document.getElementById('sidebar_right_space').style.display = "none";
		} else {
			elem.style.display = "none";
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
	    document.getElementById('scroll_to_top').style.display = "none";
	    document.getElementById('scroll_to_bottom').style.display = "block";
	    clearInterval(interval);
		}
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

	    document.getElementById('scroll_to_bottom').style.display = "none";
	    document.getElementById('scroll_to_top').style.display = "block";
	    clearInterval(interval);
	  }
	}, 20);        
    }

    // управляет элементом перемотки
    // отображает необходимый элемент при перемотки
    window.onscroll = function() {
        var coord = window.pageYOffset || document.documentElement.scrollTop;
        
        if (coord > 100){
            document.getElementById('scroll_to_bottom').style.display = "none";
            document.getElementById('scroll_to_top').style.display = "block";
        }
        else {
            document.getElementById('scroll_to_top').style.display = "none";
        }
    }
    
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
	alert(1);
	
	
	$("#" + forPrintId).clone()        		// сделаем копию элемента
	.addClass("newElement")         // добавим этой копии класс newElement
	.appendTo("#printDiv");        // вставим измененный элемент в конец элемента printDiv
	
	alert(2);
	document.getElementById('printDiv').style.display = "block";
	
	window.print();
	
	document.getElementById('printDiv').style.display = "none";
	
	document.getElementById('main_sidebar').style.display = "block";
	document.getElementById('container').style.display = "block";
    }
    
