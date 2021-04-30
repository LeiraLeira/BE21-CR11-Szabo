
<?php
session_start();

if (isset($_SESSION['user']) != "") {
    header("Location: ../../home.php");
    exit;
}

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: ../../index.php");
    exit;
}

require_once '../../components/db_connect.php';
require_once '../../components/file_upload.php';

if ($_POST) {   
    $name = $_POST['name'];
    $description = $_POST['description'];
    $address = $_POST['address'];
    $hobbies = $_POST['hobbies'];
    $age = $_POST['age'];
    $petSize = $_POST['petSize'];
    $breed = $_POST['breed'];

    // $price = $_POST['price'];
    // $supplier = $_POST['supplier'];    
    $uploadError = '';
    //this function exists in the service file upload.
    $picture = file_upload($_FILES['picture'], 'product');  
   
    if($name == 'none')
    {
   //checks if the supplier is undefined and insert null in the DB
    $sql = "INSERT INTO products (name, picture, description, address, hobbies, age, petSize, breed) 
    VALUES ('$name', '$picture->fileName', '$description', '$address', '$hobbies', '$age', '$petSize', '$breed')";
   }
   else
   {
    $sql = "INSERT INTO products (name, picture, description, address, hobbies, age, petSize, breed) 
    VALUES ('$name', '$picture->fileName', '$description', '$address', '$hobbies', '$age', '$petSize', '$breed')";
   }
    if ($connect->query($sql) === true) {

        $class = "success";
        $message = "The entry below was successfully created <br>
                        <table class='table w-50'><tr>
                        <td> $name </td>
                        
                        </tr></table><hr>
                        ";
        $uploadError = ($picture->error !=0)? $picture->ErrorMessage :'';
    } else {
        $class = "danger";
        $message = "Error while creating record. Try again: <br>" . $connect->error;
        $uploadError = ($picture->error !=0)? $picture->ErrorMessage :'';
    }
    $connect->close();
} else {
    header("location: ../error.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update</title>
    <?php require_once '../../components/boot.php'?>
</head>
<body>
    <div class="container">
        <div class="mt-3 mb-3">
            <h1>Create request response</h1>
        </div>
        <div class="alert alert-<?=$class;?>" role="alert">
            <p><?php echo ($message) ?? ''; ?></p>
            <p><?php echo ($uploadError) ?? ''; ?></p>
            <a href='../index.php'><button class="btn btn-primary" type='button'>Home</button></a>
        </div>
    </div>
</body>
</html>

