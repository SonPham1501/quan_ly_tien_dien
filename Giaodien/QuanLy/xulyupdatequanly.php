<?php 
    include '../../connect.php';
    if(isset($_POST['MaQL']) && isset($_POST['name']) && isset($_POST['ngaysinh'])&& isset($_POST['quequan']) && isset($_POST['SDT']))
    {
        $update = "UPDATE quanly SET MaQL = '".$_POST['MaQL']."', TenQL = '".$_POST['name']."', NgaySinh ='".$_POST['ngaysinh']."', DiaChi = '".$_POST['quequan']."', SDT ='".$_POST['SDT']."' where MaQL ='". $_GET['id']."'";     
        if(empty($_POST['MaQL']) || empty($_POST['name']) || empty($_POST['ngaysinh']) || empty($_POST['quequan']) || empty($_POST['SDT']))
        {
            echo "Mời bạn nhập đầy đủ thông tin .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
            exit();
        }
                 
        if( mysqli_query($connect,$update))
        {
            header('location:quanly.php');
        }
        else 
        {
            echo "Mời bạn nhập lại";
        }
    }                         
?>