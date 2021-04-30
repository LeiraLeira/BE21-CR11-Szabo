 
<?php 
session_start();
require_once 'components/db_connect.php';


// if (isset($_SESSION['user']) != "") {
//     header("Location: ../home.php");
//     exit;
// }

// if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
//     header("Location: ../index.php");
//     exit;
// }

$sql = "
SELECT * 
FROM products
WHERE petSize LIKE '%or';
";
$result = mysqli_query($connect ,$sql);
$tbody=''; //this variable will hold the body for the table
if(mysqli_num_rows($result)  > 0) {     
     while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){         
        $tbody .= "<tr>
        <tr>
        <td><img class='img-thumbnail' src='pictures/" .$row['picture']."'</td>
        <td>" .$row['name']."</td>
        <td style='display: none'>" .$row['price']."</td>
        <td>" .$row['description']."</td>
        <td>" .$row['address']."</td>
        <td>" .$row['hobbies']."</td>
        <td>" .$row['age']."</td>
        <td>" .$row['petSize']."</td>
        <td>" .$row['breed']."</td>
        </tr>";
     };
} else  {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

$connect->close();


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP CRUD</title>
    <?php require_once 'components/boot.php' ?>
    <style type="text/css">
        .manageProduct {           
            margin: auto;
        }
        .img-thumbnail{
            width: 70px !important;
            height: 70px !important;
        }
        td 
        {          
            text-align: left;
            vertical-align: middle;
        }
        tr
        {
            text-align: center;
        }
    </style>
</head>

</head>
<body>
<div class="manageProduct w-75 mt-3">    
   <div class='mb-3'>
   <!-- <a href= "create.php"><button class='btn btn-primary'type="button" >Add Product</button></a> -->
   <a href= "home.php"><button class='btn btn-primary'type="button" >Back</button></a>
   <a href= "logout.php?logout"><button class='btn btn-primary'type="button" >Sign Out</button></a>
   </div>
   <p class='h2'>Animals</p>
   
   <table class='table table-striped'>
       <thead class='table-success'>
           <tr>
           <tr>
               <th>Picture</th>
               <th>Name</th>
               <th>Description</th>
               <th>Address</th>
               <th>Hobbies</th>
               <th>Age</th>
               <th>PetSize</th>
               <th>Breed</th>
           </tr>
           </tr>
       </thead>
       <tbody>
          <?= $tbody; ?>
       </tbody>
   </table>
</div>

</body>
</html>

