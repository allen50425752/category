<?php
	$db_host = '127.0.0.1';
	$db_user = 'root';
	$db_password = '';
	$db_name = 'category';
	$link = mysqli_connect($db_host,$db_user,$db_password) or die(mysqli_error());
	mysqli_select_db($link,$db_name) or die(mysqli_error());
	mysqli_query($link,"set names utf8");
?>