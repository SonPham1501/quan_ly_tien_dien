<?php
    include '../../connect.php';
    $sd = $_POST['sd'];
       
   
            $query1="UPDATE `trangthaisodien` SET `SoTien/Kwh`=$sd WHERE 1";
            
            if (mysqli_query($connect, $query1)) {
                header("location:trangthaisodien.php");
            } else {
                echo "Lỗi: " . $query1 . "<br>" . mysqli_error($connect);
            }
         
?>