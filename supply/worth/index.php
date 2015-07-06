<?php
	// список языков
	$sites = array(
	    "en" => "http://vteple.net/worth/en-us/",
	    "ru" => "http://vteple.net/worth/ru-ru/",
	    "de" => "http://vteple.net/worth/de-de/",
		"it" => "http://vteple.net/worth/it-it/"
);
	// получаем язык
	$lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
	// проверяем язык
	//if (!in_array($lang, array_keys($sites))){
	    $lang = 'ru';
	//}
	// перенаправление на субдомен
	header('Location: ' . $sites[$lang]);
	
?>