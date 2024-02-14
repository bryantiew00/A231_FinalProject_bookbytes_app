<?php
//error_reporting(0);
include_once("dbconnect.php");
$email = $_GET['email']; 
$userid = $_GET['userid'];
$phone = $_GET['phone'];
$amount = $_GET['amount'];
$name = $_GET['name'];
//$sellerid = $_GET['sellerid'];

$api_key = '7d00d8a4-c68b-4368-8360-bea7cc0e1fdd';
$collection_id = 'sy9gewbe';
$host = 'https://www.billplz-sandbox.com/api/v3/bills';

$data = array(
          'collection_id' => $collection_id,
          'email' => $email,
          'mobile' => $phone,
          'name' => $name,
          'amount' => ($amount) * 100,
          'description' => 'Payment for order by '.$name,
          'callback_url' => "https://bryan.infinitebe.com/bookbytes/return_url",
          'redirect_url' => "https://bryan.infinitebe.com/bookbytes/php/update_payment.php?userid=$userid&email=$email&phone=$phone&amount=$amount&name=$name" 
);

$process = curl_init($host );
curl_setopt($process, CURLOPT_HEADER, 0);
curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($process, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($process, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($process, CURLOPT_POSTFIELDS, http_build_query($data) ); 

$return = curl_exec($process);
curl_close($process);
$bill = json_decode($return, true);
print_r($bill);
header("Location: {$bill['url']}");

//update book status
$bookid = $cartarray['book_id'];
$qty = $cartarray['cart_qty'];
$sqlupdatecart = "UPDATE `tbl_books` SET `book_qty`='book_qty' - $qty WHERE `book_id` = '$bookid'";
$conn -> query($sqlupdatequantity);
?>