<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin:0px;
            padding:0px;
        }

        #page{
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #divInfo{
            border:3px solid rgb(140, 0, 255); 
            border-radius: 10px;
            text-align: center;
            /* position: relative; */
            width: 50%;
            height:70% ;
            display:flex ;
            flex-direction: column;
            justify-content: space-between;
        }
        #tile-game{
            font-size: 80px;
            color: gold;
            text-shadow: 2px 2px 4px #000000;
        }
		#result{
            font-size: 60px;
            color: rgba(34, 0, 255, 0.577);
            font-style:bold;
            text-shadow: 2px 2px 4px #1bd111;
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
        .info{
            font-size: 30px;
            margin: 10px;
        }
        #btnbar{
            display: flex;
            justify-content: space-around;
            align-items:flex-end ;
            /* position: absolute;
            bottom: 30px; */
        }
        #Exit{
            width: 100px;
            height:30px ;
            font-size: 15px ;
            color:white ;
            background:linear-gradient(to bottom right, #344275, #3a6389);
            border-radius: 5px;
            margin: 40px;
        }
        #Playagain{
            width: 100px;
            height:30px ;
            font-size: 15px ;
            color:white ;
            background:linear-gradient(to bottom right, #344275, #3a6389);
            border-radius: 5px;
            margin: 40px;
        }
    </style>
<title>JEE_jeux</title>
</head>
<body>
    <div id="page">
        <div id="divInfo">
            <div>
                <p id="tile-game">Game Over</p>
                <p class="info">Temps :<strong id="temp">0:00</strong></p>
                
                        <%
					    	String xpv=(String)request.getAttribute("pvKnightValue");
					    	out.println("<p class='info'>Point de vue : <strong>"+ xpv +"</strong></p>");
				   	 	 %>
				   	 	<%
					    	String xe=(String)request.getAttribute("ExperienceValue2");
					    	out.println("<p class='info'>Experience : <strong>"+ xe +"</strong></p>");
				   	 	 %>
				   	 	 				   	 	<%
					    	String resultat=(String)request.getAttribute("resultat");
				   	 	 	if("true".equals(resultat)){
				   	 	 		out.println("<p id='result'>Good Job </p>");
				   	 	 	}else{
				   	 	 		out.println("<p id='result'>Try Again , you can do it  </p>");
				   	 	 	}
					    	
				   	 	 %>
            </div>
            <div id="btnbar">
                <form action="WelcomePage.jsp">
                    <button type="submit" id="Exit">Exit</button>
                    <input type="hidden" name="exit" value="true">
                </form>
                <form action="mainServlet">
                    <button type="submit" id="Playagain">Play Again</button>
                    <input type="hidden" name="Playagain" value="true">
                </form>
            </div>
        </div>
    </div>
    <script>
        <%
    	String xt=(String)request.getAttribute("timeValue");
    	out.println("let totalSeconds="+ xt +";");
   	 	 %>
        const timerElement = document.getElementById('temp');

        const minutes = Math.floor(totalSeconds / 60);
        const seconds = totalSeconds % 60;

		<%
		out.println("const formattedTime = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;");
		%>
        timerElement.innerText = formattedTime;

    </script>
</body>
</html>