<?php
error_reporting(0);
$servername = "infinitebe.com";
$username = "infinmwk_bryan";
$password = "IKOBiUVeV{bu";
$dbname = "infinmwk_bryan_bookbytes_db";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>