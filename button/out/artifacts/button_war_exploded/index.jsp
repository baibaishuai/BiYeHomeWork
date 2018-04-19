<%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/3/22
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>登录界面</title>
  <style>
    body{
      background-image: url("/images/bac.png");
    }
    .button {
      border: none;
      color: white;
      padding: 5px 15px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 24px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 8px;
      background: rgba(186, 186, 186, 0.65);<%-- 透明度--%>
      width: 70%;
      border: 1px solid #FFFFFF;
      top: 10px;
      width: 500px;

    }

    .button1:hover{
      color: #BABABA;
      background-color: #FFFFFF;
    }

    .center{
      width: 560px;
      height: 380px;
      padding: 30px;
      border: 1px solid #E0DEDC;
      border-radius: 8px;<%--角的弯曲度--%>
      box-sizing: border-box;
      margin:auto;
      margin-top: 10%;
    }
    p1{
      color: #FFFFFF;
      text-decoration: none;
      font-size: 24px;
    }
    .input{width: 500px;
      border: 1px solid #FFFFFF;
      border-radius: 8px;
      font-size: 24px;
      background: rgba(186, 186, 186, 0.65);
      /*left: 15px;*/
      padding-left: 10px;
    }

    a:link {color:#000000;}      /* 未访问链接*/
    a:visited {color:white;}  /* 已访问链接 */
    a:hover {color:#FF00FF;}  /* 鼠标移动到链接上 */
    a:active {color:#0000FF;}
    a:link {text-decoration:none;}/*默认link没有下划线*/
    a:hover {text-decoration:underline;}/*鼠标放在上面后，出现下划线*/


  </style>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script>
      $(document).ready(function () {
          $("button").click(function () {
              $("#test").hide();
          });
      });
  </script>

  <script>
      $(document).ready(function () {
          $("#but").click(function () {
              $("#03").load("/ajax/deno.txt");
          });
      });
  </script>
  <script>
    $(document),ready(function () {
        $("#btn").click(function () {
            $.get("/ajax/text.php",function (data,status) {
                alert("数据："+data+"\n状态"+status);
            });
        });
    });
  </script>
  <script src="/js/jax.js"></script>
</head>
<body>

<h2 style="color: #FFFFFF">JOIN</h2>
<div class="center ">
  <form action="/LoginServlet" method="post">
  <p1 >用户登录</p1><hr color="white">
  <br/>
  <input class="input" type="text" name="username" placeholder="用户名">
  <br/>
  <br/>
  <input class="input" type="password" name="pwd" placeholder="密码">
  <br/>
  <br/>
  <select name="sel" class="input input2">
    <option value="stadiumUser" >场馆用户</option>
    <option value="admin" >管理员</option>
  </select>
  <br/>
  <br/>
    <p1><a href="signin.jsp" >注册账号</a></p1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p1><a href="http://www.4399.com" >忘记密码</a></p1>
  <br/>
  <br/>
    <input type="submit" value="登录" class="button button1">
  </form>
</div>
<input type="button" onclick="alert('welcome')" value="welcome">

<p id="test">sjflkdsfjdskfdsf</p>
<button>点我</button>
<p id="03">接下来会被ajax覆盖</p>
<input id="but" type="button" value="dianwo">
<input id="btn" type="button" value="获取外部数据">
</body>
</html>
