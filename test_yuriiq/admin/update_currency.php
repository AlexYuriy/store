<?php
function euro()
{
    $xml = new XMLReader();
    $xml->open('http://www.cbr.ru/scripts/XML_daily.asp');
    while ($xml->read())
    {
        if(($xml->nodeType == XMLReader::ELEMENT) && ($xml->getAttribute('ID') == 'R01239'))
        {
            while($xml->read())
            {
                if($xml->name == 'Value')
                {
                    $xml->read();
					return $xml->value;
                }
            }
        }
    }
    $xml->close();
}
// $this->model_localisation_currency->editCurrency('1', $xml->value);
$result = 1/ (str_replace(",", ".", euro()) * 1.02);

// Version
define('VERSION', '1.5.5.1.2');

// Configuration
if (file_exists('config.php')) {
	require_once('config.php');
}  

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . $result . "', date_modified = NOW() WHERE currency_id = '6'");
$query = $db->query("SELECT value FROM " . DB_PREFIX . "currency WHERE currency_id = '" .(int)$currency_id. "'");
$currency=$query->row['value'];
$results = $db->query("SELECT product_id,price,base_price from  " . DB_PREFIX . "product where currency_id='".$currency_id."'");
foreach ($results as $result) {
		$result['price']=$result['base_price']*$currency;
		$db->query("UPDATE " . DB_PREFIX . "product SET product price = '". $result['price'] . "' where product_id='".$result['product_id']."'");
}
?>

