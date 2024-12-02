<?php
$connect = mysqli_connect(
    'db', # service name
    'user', # username
    'password', # password
    'course_catalog' # db table
);
if ($connect->connect_error) { die("Connection failed: " . $connect->connect_error); }
$categories = "categories";
$courses = "course_list";

$query_categories = "SELECT * FROM $categories";
$query_list = "SELECT * FROM $courses";

$response = mysqli_query($connect, $query_categories);
$response2 = mysqli_query($connect, $query_list);