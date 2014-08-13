// ������������ ������ �������� ���� sidebar

    var id_menu = new Array('other_links', 'categories', 'cart');
    var id_sidebar_right_space = "id_sidebar_right_space";
    var for_scroll = new Array('sidebar', 'other_links', id_sidebar_right_space, 'categories', 'cart');
    var y_coord; // ��������� ��������� ��� ��������� �����
    var widthSidebarItem = 80;	// ������ �������� �������� ����

    // ������� ������� ���� ������ ������ ��������
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

    // ������� ������� ����
    function closeMenu(id){
        for (var i = 0; i < id_menu.length; i++){
            document.getElementById(id_menu[i]).style.display = "none";
            document.getElementById(id_sidebar_right_space).style.display = "none";
        } 
    }

    // ���� ������ ����� �� ���� �����
    function moveMenuScreen(){  
        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;    
     //   obj.style.left = (document.body.clientWidth / 2 - obj.clientWidth / 2 + document.body.scrollLeft) + 'px';  
        for (var i = 0; i < for_scroll.length; i++){
            var obj = document.getElementById(for_scroll[i]);
            obj.style.top = scrollTop + 'px';  
        }
    }  

    // ������������ ����� 
    function scrollToTop(){
        y_coord = window.pageYOffset || document.documentElement.scrollTop;
	var y = y_coord;
	
	// ������������ ������� ���������
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

    // ������������ ���� ����� ��������� �����
    function scrollToBottom(){
      var y = 0;      
     
	// ������������ ������� ���������
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

    // ��������� ��������� ���������
    // ���������� ����������� ������� ��� ���������
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
    
    // ������������ ������ �������� ����. �������� ��� �������� �������� � ��������� ������� ����
    function calc_sidebar_meter(){
	var windowHeight = window.innerHeight;
	var heightScrollItem = Math.ceil(windowHeight - 4 * widthSidebarItem - 3);
	var margin_top_img = Math.ceil(heightScrollItem / 2 - 40); // ������ ����������� �� ����� ������ ���������
	
	if (heightScrollItem < 80) heightScrollItem = 80;
	
	document.getElementById('scroll_to_bottom').style.height = heightScrollItem + "px";
        document.getElementById('scroll_to_top').style.height = heightScrollItem + "px";
        document.getElementById('temp_scroll_item').style.height = heightScrollItem + "px";
	
	document.getElementById('temp_scroll_img').style.marginTop = margin_top_img + "px";
	document.getElementById('scroll_to_bottom_img').style.marginTop = margin_top_img + "px";
        document.getElementById('scroll_to_top_img').style.marginTop = margin_top_img + "px";
    }
    
    // ������� ��� �������� �� ����� ������
    // ������� ������, �� ���������� � ��������������
    function getElementByClassName (class_name){
		// ������� ��������� ��������� ���� body:
		var elements = document.body.getElementsByTagName("*"),
		    length   = elements.length,
		    out = [], i;
	
		// �������� �� ���... ��� ������:
		for (i = 0; i < length; i += 1) {
	
		    // �������� � �������������� ������ ��������, ���������� ��������� �����:
		    if (elements[i].className.indexOf(class_name) !== -1) {
			out.push(elements[i]);
		    }       
		}        
		return out;
    };
    
    // ������ ������ �������
    function print_cart(){
	// ��������, ������� ���������� �����������
	var forPrintClass = new Array('cart-info', 'cart-module', 'cart-total', 'warning', 'content');
	var forPrintId = new Array('container', 'content');
      
	// ������� ��������� ��������� ���� body:
	var elements = document.body.getElementsByTagName("div");
	var length   = elements.length;
	var lengthForPrint = forPrintClass.length;
	var out = [], i, j, k;
	var notShow = new Array();
	var print;	// �������� �� �������
	
	// ���� ���� ������� �� �������� ������ - ������� �� ��������
	for (i = 0; i < length; i += 1) {
	    print = false;
	    
	    // ���������� ��������, ������� �� ���� ��������
	    if (elements[i].style.display == "none") {
// 		alert(elements[i].className);
		notShow[notShow.length] = elements[i];
		continue;
	    }
	    
	    // ����� �� ������
	    for (j = 0; j < lengthForPrint; j++){
		 if (elements[i].className == forPrintClass[j]) {
		    print = true;
		    continue;
		 }		 
	    }
	    
	    // ����� �� id
	    for (j = 0; j < lengthForPrint; j++){
		if (elements[i].id == forPrintId[j] || print){
		    print = true;
		    continue;
		}
	    }
	    
	    if (print) elements[i].style.display = "block";
	    else elements[i].style.display = "none";
	}
	
	// ������
	window.print();
	
	// 
	alert('Print success');
	
	location.reload();
	
	
    };
    
    function printDoc(forPrintId){
	
	document.getElementById('main_sidebar').style.display = "none";
	document.getElementById('container').style.display = "none";
	alert(1);
	
	
	$("#" + forPrintId).clone()        		// ������� ����� ��������
	.addClass("newElement")         // ������� ���� ����� ����� newElement
	.appendTo("#printDiv");        // ������� ���������� ������� � ����� �������� printDiv
	
	alert(2);
	document.getElementById('printDiv').style.display = "block";
	
	window.print();
	
	document.getElementById('printDiv').style.display = "none";
	
	document.getElementById('main_sidebar').style.display = "block";
	document.getElementById('container').style.display = "block";
    }
    
