<?php
include_once("dbconnect.php");

if (empty($_POST)) {
    $response = array('status' => 'failed', 'message' => 'No data received');
    sendJsonResponse($response);
    die();
}

if (isset($_POST['newphone'])) {
    $phone = $_POST['newphone'];
    $userid = $_POST['user_id'];
    $sqlupdate = "UPDATE tbl_users SET user_phone ='$phone' WHERE user_id = '$userid'";
    databaseUpdate($sqlupdate);
    die();
}

if (isset($_POST['newname'])) {
    $name = $_POST['newname'];
    $userid = $_POST['user_id'];
    $sqlupdate = "UPDATE tbl_users SET user_name ='$name' WHERE user_id = '$userid'";
    databaseUpdate($sqlupdate);
    die();
}

if (isset($_POST['user_id']) && isset($_POST['old_password']) && isset($_POST['new_password'])) {
    $userid = $_POST['user_id'];
    $old_password = sha1($_POST['old_password']);
    $new_password = sha1($_POST['new_password']);

    $sqlCheckPassword = "SELECT * FROM `tbl_users` WHERE `user_id` = '$userid' AND `user_pass` = '$old_password'";
    $result = $conn->query($sqlCheckPassword);

    if ($result->num_rows > 0) {
        // Password match found, update the password
        $sqlUpdatePassword = "UPDATE `tbl_users` SET `user_pass` = '$new_password' WHERE `user_id` = '$userid'";
        if ($conn->query($sqlUpdatePassword) === TRUE) {
            $response = array('status' => 'success', 'message' => 'Password updated successfully');
            sendJsonResponse($response);
        } else {
            $response = array('status' => 'failed', 'message' => 'Failed to update password: ' . $conn->error);
            sendJsonResponse($response);
        }
    } else {
        // No matching user ID and old password found
        $response = array('status' => 'failed', 'message' => 'Invalid user ID or old password');
        sendJsonResponse($response);
    }
} else {
    $response = array('status' => 'failed', 'message' => 'Missing parameters');
    sendJsonResponse($response);
}

$conn->close();

function databaseUpdate($sql){
    global $conn; // Access the global variable $conn
    if ($conn->query($sql) === TRUE) {
        $response = array('status' => 'success', 'data' => null);
        sendJsonResponse($response);
    } else {
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
    }
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>
