<?php 
include '../../connect.php';
if(isset($_GET['id'])){
    $user=$_GET['id'];
    $sql = "SELECT * FROM user where userID = '$user'";
    $result = mysqli_query($connect,$sql);
    if(mysqli_num_rows($result)>0)
    {
        while($row =mysqli_fetch_assoc($result))
        {
        
            $role=$row['role'];
            
        }
    }
        if($role=='QL'){
            echo 'sao xóa được Quản Lý bạn êi?? '; ?>
            <button type="button" onclick="getBack()">Quay lại</button>
 	<script type="text/javascript">
		function getBack() {
			
			history.go(-1);
		}		
	</script>	
    <?php 
            exit();
        }
   
    else{
        $query="delete from user where userID='$user'";
    mysqli_query($connect,$query) or die('Xóa không thành công');
    header('location:taikhoan.php');

    
}
}
?>