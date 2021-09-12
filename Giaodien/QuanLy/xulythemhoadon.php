<?php
session_start();
    include '../../connect.php';
    //lấy số tiền trên 1 số điện
    $sql = "SELECT * FROM trangthaisodien";
	$result = mysqli_query($connect,$sql);
    $row =mysqli_fetch_assoc($result);  
    //lấy chỉ sô điện cũ
    
    $sql2 = "SELECT * FROM khachhang";
    $result2 = mysqli_query($connect,$sql2);
    $row2 =mysqli_fetch_assoc($result2);  
    
    $nn=$row2['SDT'];

    $makh = $_POST['makh'];
    $sql1 = "SELECT * FROM chisodiencu where MaKH = '$makh'";
    $result1 = mysqli_query($connect,$sql1);
    $row1 =mysqli_fetch_assoc($result1);
    //
    $mahd = $_POST['mahd'];
    $ngayphaithanhtoan = $_POST['ngayphaithanhtoan'];
    $ngaythanhtoan = "";
    $chisocu = $row1['ChiSoCu'];
    $chisomoi = $_POST['chisomoi'];
    $soKwh = $chisomoi - $chisocu;
    
    $sotienKwh = $row['SoTien/Kwh'];
    if( $nn == "SV"){
        if ($soKwh > 50) {
                 $sotienKwh1 =$sotienKwh +400;
                $tongtien = $soKwh*$sotienKwh1;
        }
        else{
                $sotienKwh1=$sotienKwh;
                $tongtien = $soKwh*$sotienKwh1;


        }
    }
    else
           {
            if ($soKwh > 50) {
                $sotienKwh1 =$sotienKwh +500;
               $tongtien = $soKwh*$sotienKwh1;
       }
       else{
               $sotienKwh1=$sotienKwh;
               $tongtien = $soKwh*$sotienKwh1;


       }
}
    $trangthai = "Chưa đóng";     
    $query1="INSERT INTO hoadon VALUES('".$mahd."','".$makh."','".$ngayphaithanhtoan."','".$ngaythanhtoan."',".$chisocu.",".$chisomoi.",".$soKwh.",".$sotienKwh1.",".$tongtien.",'".$trangthai."')";
    $query2="UPDATE chisodiencu SET chisocu = $chisomoi WHERE MaKH = '$makh'";
        if(isset($_POST['mahd']) && isset($_POST['makh']) && isset($_POST['ngayphaithanhtoan']) && isset($_POST['chisomoi']))
        {
            if(empty($_POST['mahd']) || empty($_POST['makh']) || empty($_POST['ngayphaithanhtoan']) || empty($_POST['chisomoi']))
            {
                echo "Mời bạn nhập đầy đủ thông tin .<a href='javascript: history.go(-1)'>Trở lại</a>"; 
                exit();
            }
            if (mysqli_query($connect, $query1)) {
                mysqli_query($connect,$query2);
                header("location:hoadon.php");
            } else {
                echo "Lỗi: " . $query1 . "<br>" . mysqli_error($connect);
            }
        }  
?>