<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <style>
        *{
    padding:0 ;
    margin:0 ;
}
h4 {
    font-size: 30px;
  }
.divNames{
    text-align:center ;
}
#gameControl{
    display: flex;
    justify-content: space-between; 
}
.relodBtn{
    width: 100px;
    height:30px ;
    font-size: 15px ;
    color:white ;
    background:linear-gradient(to bottom right, #344275, #3a6389);
    border-radius: 5px;
}
.names{
    font-size:20px ;
}
body{
    display: flex;
    justify-content: center;
    align-items: center;
    height:100vh ;
    /* background-image: url(background.gif);
    background-size: cover; */
}
#game-container{
    width: 900px;
    height: 500px; 
    border: 3px solid black;
    position: relative;
    overflow: hidden;
}
#player-container {
    height: 100vh; 
    display:flex;
    justify-content: space-between;
    position: relative;
    overflow: hidden;
}
.divbar{
    display:flex;
    justify-content: space-between;
    border-bottom:1px solid black;

}
.barPlayer{
    width: 300px;
    height: 20px;
    border-radius: 5px;
    box-shadow:inset 2px 4px 2px #d9dade,inset -4px -4px 2px #d9dade;
}
.barPlayer .progressPlayer{
    	<%
			String x=(String)request.getAttribute("pvKnight");
			out.println("width:"+ x +"%;");
		%>
    height: 20px;
    border-radius: 5px;
    text-align:center ;
    color: white;
    /* box-shadow:inset 6px 6px 6px #d9dade,inset -6px -6px -6px #d9dade; */
    background-color:rgb(27, 200, 97) ;
}
.barEnemy{
    width: 300px;
    height: 20px;
    border-radius: 5px;
    display: flex;
    justify-content: flex-end;
    box-shadow:inset 2px 4px 2px #d9dade,inset -4px -4px 2px #d9dade;
}
.barEnemy .progressEnemy{
    	<%
			String y=(String)request.getAttribute("pvEnemy");
			out.println("width:"+y+"%;");
		%>
    height: 20px;
    border-radius:5px ;
    text-align:center ;
    color: white;
    background-color:rgb(27, 200, 97) ;
}
.exper{
    	<%
			String ex=(String)request.getAttribute("ExperienceValue");
			out.println("width:"+ex+";");
		%>
		
    height: 7px;
    border-radius:5px ;
    background-color:rgb(255, 230, 0);
}
/* .magi{

    width: 60%;
    height: 7px;
    border-radius:5px ;
    background-color:rgb(0, 191, 255);
} */
#player {
    height: 80px; 
    margin-left: 10px; 
    position: absolute;
    top: 150px;
    display:flex;
    align-items: center;
    /* background-color:white ; */
}

#Playerattack {
    width: 20px;
    height: 20px;
    border-radius:50% ;
    background-color: blue;
    /* display: none;  */

}
.actionAttack{
    
    animation: go .5s linear 0s 1 normal none;
}
@keyframes go {
    0%{
        translate:0 0;
    }
    100%{
        translate:730px 0;
        background-color:rgb(226, 43, 43) ;
    }
}
#enemy {
    height: 80px; 
    margin-right: 10px; 
    position: absolute;
    top: 150px;
    right:10px ;
    display:flex;
     align-items: center;

}
#Enemyattack {
    width: 20px;
    height: 20px;
    border-radius:50% ;
    background-color: rgb(4, 85, 16);

}
#Playerattack:hover{
    transform: translate(700px);
    transition:1s;

}
button {
    display: block;
    margin-top: 20px;
}
    </style>
    <title>JEE_jeux</title>
</head>
<body>
<div id="scren">
    <div id="game-container">
        <div class="divbar">
            <div class="coterPlayer">
                <div class="barPlayer"><div class="progressPlayer" id="progressPlayer">120 </div></div>

                <div class="divNames">
                    <p class="names"><strong>abdelkarim</strong></p>
                </div>
                <div class="exper"></div>
                <div class="magi"></div>
            </div>
            <div class="time"><h4 id="timer"></div></h4>
            <div class="coterEnemy">
                <div class="barEnemy"><div class="progressEnemy" id="progressEnemy">170</div></div>
                <div class="divNames">
                    <p class="names"><strong>Dexter</strong></p>
                </div>
            </div>
        </div>
        

        <div id="player-container">
        <div id="player">
            <div id="divImgPlayer">
                 <img src="images/wizard.png" alt="player" height="80px">
            </div>
            <div id="Playerattack" ></div>
        </div>

        <div id="enemy">
            <div id="Enemyattack"></div>
            <div id="divImgEnemy">
                <img src="images/enemy.png" alt="player" height="80px">
            </div>
        </div>
    </div>
</div>
<div id="gameControl">
	
	<form action="WelcomePage.jsp" method="get"  >
    	<button type="submit" class="relodBtn" >Exit</button>
    </form>
    
	<form action="mainServlet" method="get"  >
    	<input type="hidden" id="reloade" name="isreloade" value="true">
    	<button type="submit" class="relodBtn" >Restart Game</button>
    </form>
    
    

    <form action="mainServlet" method="get" hidden >
        <button type="submit" id="Attacksub" ></button>
        <input type="hidden" name="isAttack" id="isattack" value="true">
        <input type="hidden" id="valuetop" name="topValue" value="">
        <input type="hidden" id="timeValue" name="time" value="">
    </form>

    </div>

</div>
<script>
    
let player = document.getElementById('player');
let container = document.getElementById('player-container');
let atak =document.getElementById('Playerattack');
atak.style.display="none";

<%
	String xt=(String)request.getAttribute("timeValue");
	out.println("let totalSeconds="+ xt +";");
%>
/* player.style.top='150px'; */
	<%
	String x3=(String)request.getAttribute("topValue");
	out.println("player.style.top='"+ x3 +"';");
	%>
let progressPlayer=document.getElementById('progressPlayer')
    	<%
			String x2=(String)request.getAttribute("pvKnightValue");
			out.println("progressPlayer.innerHTML='<strong>"+ x2 +"</strong>';");
		%>

let progressEnemy=document.getElementById('progressEnemy')
    	<%
			String y2=(String)request.getAttribute("pvEnemyValue");
			out.println("progressEnemy.innerHTML='<strong>"+ y2 +"</strong>';");
		%>
		let enemy = document.getElementById('enemy');
		<%
		String y3=(String)request.getAttribute("TopEnemyValue");
		out.println("enemy.style.top='"+ y3 +"';");
		%>
		
document.addEventListener('keydown', function(event) {
    
    const containerHeight = container.clientHeight;
    const playerHeight = player.clientHeight;

    let topPos = parseInt(player.style.top) ;


    if (event.key === 'a' || event.key === 'A') {
        if(topPos<10){
            return ;
        }
        if (topPos - 10 >= 0) {
            player.style.top = (topPos - 10) + 'px';
        }
    } else if (event.key === 'w' || event.key === 'W') {
        if(parseInt(player.style.top)==370){
            return ;
        }
        if (topPos + 10 <= containerHeight - playerHeight) {
            player.style.top = (topPos + 10) + 'px';
        }
    }
    console.log(parseInt(player.style.top))
});
console.log(parseInt(player.style.top))

function attack(){
    
     
     atak.style.display="block";
     atak.classList.add("actionAttack");
     setTimeout(function() {
        atak.classList.remove("actionAttack");
        atak.style.display="none";
        
        let isatack=document.getElementById('isattack');
         
        if(parseInt(player.style.top)-parseInt(enemy.style.top)<=30 && parseInt(player.style.top)-parseInt(enemy.style.top) >= -40 ) 
        {
            isatack.value='true';
        }else{
            isatack.value='false';
            
        }
        
        let ubmit =document.getElementById("Attacksub");
        let timer =document.getElementById("timeValue");
        timer.value=totalSeconds;
        let valuetop=document.getElementById("valuetop");
        valuetop.value=player.style.top;
        ubmit.click();
    }, 500);
     
    
}

document.addEventListener('keydown', function(event) {
    if (event.key === ' ' || event.code === 'Space') {
        attack();
    }
});
const timerElement = document.getElementById('timer');

function updateTimer1() {
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;

    // Ajouter un zéro devant les chiffres de moins de 10
    
	<%
	out.println("const formattedTime = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;");
	%>
    timerElement.innerText = formattedTime;

    // Arrêter le compteur après 2 minutes
    if (totalSeconds === 0) {
    	return ;
        clearInterval(intervalId);
    }

    totalSeconds--;

    
}

function startTimer() {
    
    

    function updateTimer() {
        const minutes = Math.floor(totalSeconds / 60);
        const seconds = totalSeconds % 60;

        // Ajouter un zéro devant les chiffres de moins de 10
        
		<%
		out.println("const formattedTime = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;");
		%>
        timerElement.innerText = formattedTime;

        // Arrêter le compteur après 2 minutes
        if (totalSeconds === 0) {
        	attack();
        	return ;
            clearInterval(intervalId);
        }

        totalSeconds--;

        
    }

    // Mettre à jour le timer toutes les secondes
    const intervalId = setInterval(updateTimer, 1000);

}

updateTimer1(); 
startTimer();

/* document.addEventListener('DOMContentLoaded', startTimer); */

</script>
    
</body>
</html>