
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/all.css">
    <link rel="stylesheet" href="style/style_dangnhap.css">
</head>

<body>
    <div id="login">
        <div class="container">
            <div class="alert alert-info , xinchao"  role="alert">
                <i class="far fa-hand-point-right"></i>  Chào mừng Quý Khách đến với trang đăng nhập của dịch vụ thanh toán tiền điện online <i class="far fa-hand-point-left"></i>
              </div>
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                        <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="username" placeholder="Enter email" name="username" style="width:500px">
    </div>
    <div class="form-group" >
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" style="width:500px">
    </div>
    <a id="quenmk" style=" position: relative;;left:300px;bottom:15px" href="quenmk.php">Forget Password</a><br>
    <button type="submit" id ="btndangnhap" class="btn btn-primary" name="btn_dangnhap" style="margin-left:300px">Submit</button>
                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="error" style="color: red; margin-left:300px; "></div>
    </div>
    <script type="text/javascript">
		$("#btndangnhap").click(function() {
			var username=$("#username").val();
            var password=$("#password").val();
            var error = $("#error");
      
		if (username == "") {
			error.html("Tên đăng nhập không được để trống");
			return false;
		}
		
		if (password == "") {
			error.html("Mật khẩu không được để trống");
			return false;
		}
			$.ajax({
				url: 'xulydangnhap.php',
				type: 'POST',
				dataType: 'html',
				data: {username:username ,password:password},
				success:function(response){
					if(response== 1)
					{
						window.location="role.php";
					}
          else {error.html("Mật khẩu hoặc tài khoản không chính xác !");}

				}
			})		
		});
		
	</script> 
</body>

</html>