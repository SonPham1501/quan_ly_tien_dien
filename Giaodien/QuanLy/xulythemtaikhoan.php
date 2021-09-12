<?php
    include '../../connect.php';
    $username = $_POST['username'];
    $password = $_POST['mkhau'];
    $confimPW = $_POST['confimMK'];
    $name = $_POST['name'];    
    $hashpass=password_hash($password,PASSWORD_DEFAULT);
    if($password == $confimPW)
    {
        $query1="INSERT INTO user VALUES('".$username."','".$hashpass."','".$name."','KH')";
        if(isset($_POST['username']) && isset($_POST['mkhau']) && isset($_POST['confimMK']) && isset($_POST['name']))
        {
            if(empty($_POST['username']) || empty($_POST['mkhau']) || empty($_POST['confimMK']) || empty($_POST['name']))
            {
                echo "Mời bạn nhập đầy đủ thông tin .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
                exit();
            }
            if (mysqli_query($connect, $query1)) {
                header("location:taikhoan.php");
            } else {
                echo "Lỗi: " . $query1 . "<br>" . mysqli_error($connect);
            }
        }
    }
    else
    {
        echo "Mời bạn nhập mật khẩu nhập lại và mật khẩu phải giống nhau .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
        exit();
    }
?>