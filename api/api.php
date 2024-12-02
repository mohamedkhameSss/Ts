<?php
header("Access-Control-Allow-Origin: *"); header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$path = explode('/', trim($_SERVER['PATH_INFO'], '/'));

switch ($path[0]) {
    case 'categories':
        if ($method == 'GET') {
            if (isset($path[1])) {
                getCategoryById($path[1]);
            } else {
                getCategories();
            }
        }
        break;
    case 'courses':
        if ($method == 'GET') {
            if (isset($path[1])) {
                getCourseById($path[1]);
            } else {
                getCourses();
            }
        }
        break;
    default:
        http_response_code(404);
        echo json_encode(['message' => 'Endpoint not found']);
        break;
}

function getCategories() {
    global $connect;
    $sql = "SELECT * FROM categories";
    $result = $connect->query($sql);
    $categories = [];
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
    echo json_encode($categories);
}

function getCategoryById($id) {
    global $connect;
    $sql = "SELECT * FROM categories WHERE id = '$id'";
    $result = $connect->query($sql);
    if ($result->num_rows > 0) {
        echo json_encode($result->fetch_assoc());
    } else {
        http_response_code(404);
        echo json_encode(['message' => 'Category not found']);
    }
}

function getCourses() {
    global $connect;
    $sql = "SELECT * FROM course_list";
    $result = $connect->query($sql);
    $courses = [];
    while ($row = $result->fetch_assoc()) {
        $courses[] = $row;
    }
    echo json_encode($courses);
}

function getCourseById($id) {
    global $connect;
    $sql = "SELECT * FROM course_list WHERE course_id = '$id'";
    $result = $connect->query($sql);
    if ($result->num_rows > 0) {
        echo json_encode($result->fetch_assoc());
    } else {
        http_response_code(404);
        echo json_encode(['message' => 'Course not found']);
    }
}
?>
