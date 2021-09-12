<?php
    session_start();
    include '../../connect.php';
    $sql1 = "SELECT * FROM hoadon WHERE MaHD =  '".$_GET['id']."'";
    $result1 = mysqli_query($connect,$sql1);
    $row1 =mysqli_fetch_assoc($result1);
    //

    //
    $sql = "SELECT * FROM taikhoannganhang WHERE MaThe =  '".$_SESSION['mtt']."'";
    $result = mysqli_query($connect,$sql);
    if(mysqli_num_rows($result)>0)
    {
        $row =mysqli_fetch_assoc($result);
    }
    $SoTienTrongThe = $row['TongTien'];  
    $now=getdate();
    if($SoTienTrongThe == 0 || $SoTienTrongThe < $row1['TongTien'])
    {
        echo "Tiền bên trong thẻ của bạn không đủ. Mời bạn nạp thêm thêm tiền vào thẻ .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
        exit();
    }
    else
    {      
        if($row1['TrangThai'] == "Đã đóng")
        {
            echo "Hóa đơn này đã được thanh toán .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
            exit(); 
        }
        else
        {
            $tien = $SoTienTrongThe - $row1['TongTien'];
            $query3="UPDATE taikhoannganhang SET TongTien = $tien";
            $query2="UPDATE hoadon SET NgayThanhToan = '".$now['year']."/".$now['mon']."/".$now['mday']."',TrangThai = 'Đã đóng' Where MaHD = '".$_GET['id']."'";            
            if (mysqli_query($connect, $query2) && mysqli_query($connect, $query3)) {
                header("location:hoadondanhap.php");
            } else {
                echo "Lỗi: " . $query2 . "<br>" . mysqli_error($connect);
            }
        }
    }
    
				
?>