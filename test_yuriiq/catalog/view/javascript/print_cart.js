   // печать списка товаров
    function print_cart(){
	// элементы, которые необходимо распечатать
	var forPrintClass = new Array('cart-info', 'cart-module', 'cart-total', 'warning', 'content', 'footer-logo', 'column-welcome', 'column-contacts', 'column-maps');
	var forPrintId = new Array('container', 'content', 'custom-footer-bg', 'container-footer', 'container-footer', 'custom-footer', 'header', 'logo');      

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
	    for (j = 0; j < lengthForPrint; j++) {
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
	document.getElementById('map-img').style.display = "block";

	// печать
	window.print();
	document.getElementById('map-img').style.display = "none";
	window.onfocus=function(){ location.reload();}
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
    
