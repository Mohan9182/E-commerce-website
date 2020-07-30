<?php
$con = mysqli_connect("localhost:3308", "root", "", "website")or die($mysqli_error($con));
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>
