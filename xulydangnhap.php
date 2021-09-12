<?php
session_start();
	$username=$_POST['username'];
	$password=$_POST['password'];
	include 'connect.php';
	$sql="SELECT * FROM  user  WHERE UserID = '$username' ";
	$result=mysqli_query($connect,$sql);
	//trạng thái tiền điện
	$sql1 = "SELECT * FROM trangthaisodien";
	$result1 = mysqli_query($connect,$sql1);
	//

	$_SESSION["name"]= mysqli_set_charset($connect, "UTF8");
		if(mysqli_num_rows($result)>0 && mysqli_num_rows($result1)>0)
		{
            $row=mysqli_fetch_assoc($result);
            $row1 =mysqli_fetch_assoc($result1);
			$hass=$row['PassWord'];
			if($hass==$password){
			
				$_SESSION['username'] = $username;
				$_SESSION['lv'] = $row['Role'];
				$_SESSION['name'] = $row['Name'];
				$_SESSION['sd'] = $row1['SoTien/Kwh'];
				echo '1';
			}
			else{
                echo '0';
            }
		}
	mysqli_close($connect);
	mysqli_free_result($result); 

?>
