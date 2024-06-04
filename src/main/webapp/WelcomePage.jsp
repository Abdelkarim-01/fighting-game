<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        *{
            padding:0 ;
            margin: 0;
        }
        body{
            height:100vh ;
        }
        #page{
            height: 100%;
            display:flex ;
            flex-direction:column ;
            justify-content:space-around ;
            align-items:center ;
        }
        #welcome{
            font-size: 80px;
            color: gold;
            text-shadow: 2px 2px 4px #000000;
            animation: zigzak 0.5s linear 0s infinite normal none;
        }
        @keyframes zigzak {
            0%{
                translate:0 0;
            }
            50%{
                translate:0 10px;
                color:rgb(226, 43, 43) ;
            }
            100%{
                translate:0 -10px;
                color:rgb(49, 226, 43) ;
            }
        }
        #btnstart{
            height: 60px;
            width:300px ;
            border-radius:10px ;
            color:white ;
            background:linear-gradient(to bottom right, #344275, #3a6389);
            font-size: 20px;
        }

    </style>
</head>
<body>
    <div id="page">
        <p id="welcome"><strong>Welcome fighter</strong></p>
        <form action="mainServlet">
       		 <input type="hidden" id="reloade" name="isreloade" value="true">
            <button id="btnstart" type="submit"> Start Game</button>
        </form>
    </div>
</body>
</html>