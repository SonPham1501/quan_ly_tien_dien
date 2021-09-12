<?php 
    include '../../connect.php';
    $hashpass=password_hash($_POST['mkhau'],PASSWORD_DEFAULT);
    if(isset($_POST['userID']) && isset($_POST['mkhau']) && isset($_POST['name']))
    {
        $update = "UPDATE user SET userID = '".$_POST['userID']."', passWord = '".$hashpass."', name ='".$_POST['name']."' where userID ='". $_GET['id']."'";     
        if(empty($_POST['userID']) || empty($_POST['mkhau']) || empty($_POST['name']))
        {
            echo "Mời bạn nhập đầy đủ thông tin .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
            exit();
        }
                 
        if( mysqli_query($connect,$update))
        {
            header('location:taikhoan.php');
        }
        else 
        {
            echo "Mời bạn nhập lại";
        }
    }                         
?>