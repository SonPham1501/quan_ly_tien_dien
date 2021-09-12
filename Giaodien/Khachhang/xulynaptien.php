<?php
    session_start();
    include '../../connect.php';
    $sql = "SELECT * FROM taikhoannganhang WHERE MaThe =  '".$_SESSION['mtt']."'";
    $result = mysqli_query($connect,$sql);
    if(mysqli_num_rows($result)>0)
    {
        $row =mysqli_fetch_assoc($result);
    }
    $SoTienTrongThe = $row['TongTien'];
    $SoTienNap = $_POST['tien'];
    $TongTien = $SoTienTrongThe + $SoTienNap;
    if(isset($_POST['tien']))
        {
            $query1="UPDATE taikhoannganhang SET TongTien = $TongTien";
            if(empty($_POST['tien']))
            {
                echo "Mời bạn nhập đầy đủ thông tin .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
                exit();
            }
            if (mysqli_query($connect, $query1)) {
                header("location:thongtinthe.php");
            } else {
                echo "Lỗi: " . $query1 . "<br>" . mysqli_error($connect);
            }
        }  
				
?>