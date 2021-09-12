<?php
session_start();
	$mt=$_POST['mt'];
	$pw=$_POST['pw'];
	include '../../connect.php';
	$sql="SELECT * FROM taikhoannganhang   WHERE MaThe = '$mt' and TenChuThe = '".$_SESSION['name']."'";
	$result=mysqli_query($connect,$sql);
		if(mysqli_num_rows($result)>0)
		{
            $row=mysqli_fetch_assoc($result);
            $mk=$row['MatKhau'];
         	if($mk==$pw){
             $_SESSION['mtt']=$mt;
             echo 1;

         }
         else{
             echo 0;
         }  	
		}
	mysqli_close($connect);
	mysqli_free_result($result); 

?>
