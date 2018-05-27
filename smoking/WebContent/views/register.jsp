<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="viewport" content="height=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <title></title>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/register.css"/>
	<script type="text/javascript" src="../jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
   		var base = '${base}';
   		$(function(){
	   		$(".submit").click(function(){
	   			var username=$("#username").val();
	   			var password=$("#password").val();
	   			var checkpw=$("#checkpw").val();
	   			if (password!=checkpw) {
	   				$(":password").attr("value","");
		   			$(".point span:first").remove();
		   			$(".point").append("<span class='tips'>两次输入的密码不一样</span>");
				}else {
					//访问后台加数据
					$.ajax({
		                url : base + "/user/add",
		                type: "GET",
		                data:{
		    				name:username,
		    				password:checkpw
		    				},
		                error: function(request) {
		                	alert(request);
		                	alert("Connection error");
		                },
		                dataType:"json",
		                success: function(data) {
		                	var msg = eval(data).msg;      
		                	if (msg!=null) {
		                		$(":password").attr("value","");
		    		   			$(".point span:first").remove();
		    		   			$(".point").append("<span class='tips'>"+msg+"</span>");
							}else {
								
								window.location.href='choose.jsp';
							}
		                }
		            });
				}
	   		});
   		});
    </script>
</head>
<body>
    <div class="register">
        <div class="regTop">
            <span>用户注册</span>
            <a class="back" href="index.jsp">&lt;&nbsp;返回</a>
        </div>
        <div class="content">
            <div class="point">
                <span>请谨记账号密码。</span>
            </div>
            <form action="#">
                <div class="message">
                    <input type="text" id="username" placeholder="输入账号(字母，数字，下划线，减号)"  pattern="^[a-zA-Z0-9_-]{4,16}$" required/>
                    <input type="password" id="password" placeholder="请输入6-20位密码(字母，数字，下划线)" pattern="^(\w){6,20}$" required/>
                    <input type="password" id="checkpw" placeholder="请再次输入密码" required/>
                    <div class="icons">
                        <b><img src="../images/zc-1.jpg" alt=""/></b>
                        <b><img src="../images/zc-3.jpg" alt=""/></b>
                        <b><img src="../images/zc-3.jpg" alt=""/></b>
                    </div>
                </div>
                <button class="submit" type="submit" >注册</button>
            </form>
        </div>
    </div>
</body>
</html>