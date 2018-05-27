<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/login.css"/>
    <!-- 导入jquery -->
	<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
	    var base = '${base}';
	    console.log("base="+base);
	    
	    
    	function login(){
    		var username=document.getElementById("username").value;
    		var password=document.getElementById("password").value;
    		console.log(username+"   "+password);
    		
    		$.ajax({
                url : base + "/user/login",
                type: "POST",
                data:{
    				username:username,
    				password:password
    				},
                error: function(request) {
                    alert("Connection error");
                },
                dataType:"json",
                success: function(data) {
                    if (data == true) {
                        alert("登陆成功");
                        location.reload();
                    } else {
                        alert("登陆失败,请检查账号密码")
                    }
                }
            });
            return false;
    	}
   		
   		
    	
    </script>
</head>
<body>
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="../images/logo.png" alt=""/>
        </div>
        <form action="#" method="post">
            <div class="userName">
                <lable>用户名：</lable>
                <input type="text" id="username" placeholder="请输入用户名" value="55" required/>
            </div>
            <div class="passWord">
                <lable>密&nbsp;&nbsp;&nbsp;码：</lable>
                <input type="password" id="password" placeholder="请输入密码" required/>
            </div>
            <div class="choose_box">
                <div>
                    <input type="checkbox" checked="checked" name="checkbox"/>
                    <lable>记住密码</lable>
                </div>
                <a href="newPassword.jsp">忘记密码</a>
            </div>
            <button class="login_btn" type="submit" onclick="login()">登&nbsp;&nbsp;录</button>
        </form>
        
    </div>
</body>
</html>