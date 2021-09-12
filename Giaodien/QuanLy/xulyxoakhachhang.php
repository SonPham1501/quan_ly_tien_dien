<?php 
include '../../connect.php';
if(isset($_GET['id'])){
    $makh=$_GET['id'];
    $query="delete from khachhang where MaKH='$makh'";
    mysqli_query($connect,$query) or die('Xóa không thành công');
    header('location:khachhang.php');
}
?>