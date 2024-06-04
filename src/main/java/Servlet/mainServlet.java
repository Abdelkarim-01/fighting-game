package Servlet;


import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Metier.Enemy;
import Metier.Knight;
import Metier.Loot;
import Metier.Player;
import Metier.Wizard;
@WebServlet("/mainServlet")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<Player> list_players;
	public Knight Knight ;
	public Wizard Wizard ;
	public Enemy enemy ;
	public int pvKnightInit;
	public int pvEnemyInit;
	String debue="true";
	public String top="150";
@Override
public void init() throws ServletException {
	list_players=new ArrayList<Player>();
	 Knight=new Knight("Knight", 350);
	 Wizard=new Wizard("Wizard", 150,100);
	 enemy=new Enemy("enemy",120,Loot.POTION);
	 pvKnightInit=Knight.getPv();
	 pvEnemyInit=enemy.getPv();
	 list_players.add(Knight);
	 list_players.add(Wizard);
}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String isAttack=(String)request.getParameter("isAttack");
		String topValue=(String)request.getParameter("topValue");
		String isreloade=(String)request.getParameter("isreloade");
		String time=(String)request.getParameter("time");
		String playagain=(String)request.getParameter("Playagain");
		
		if(time==null) {
			request.setAttribute("timeValue", "60");
		}else {
			request.setAttribute("timeValue", time);
		}
		
		if("true".equals(playagain)) {

			init();
		}

		if("true".equals(isAttack)) {

			Knight.attack(enemy);
			enemy.attack(Knight);
			
		}
		if("true".equals(isreloade) ) {

			init();
			
		}
		if(topValue==null) {
			request.setAttribute("topValue", top +"px");
		}else {
			request.setAttribute("topValue", topValue);
			
		}
			
		request.setAttribute("pvKnight", (Knight.getPv()*100)/pvKnightInit +"");
		request.setAttribute("pvEnemy", (enemy.getPv()*100)/pvEnemyInit +"");
		
		if("true".equals(playagain)) {
			request.getRequestDispatcher("mainJeux.jsp").forward(request, response);
			init();
			return ;
		}else
			if(! Knight.isAlive() || "0".equals(time)) {
				request.setAttribute("resultat","false" );
				request.getRequestDispatcher("GameOver.jsp").forward(request, response);
			}else if(! enemy.isAlive() ) {
			request.setAttribute("resultat","true" );
			request.getRequestDispatcher("GameOver.jsp").forward(request, response);
		}	
		
		request.setAttribute("pvKnightValue", Knight.getPv() +"");
		request.setAttribute("pvEnemyValue", enemy.getPv() +"");
		request.setAttribute("ExperienceValue2", Knight.getExperience() +"");
		request.setAttribute("ExperienceValue", Knight.getExperience() +"%");
		request.setAttribute("TopEnemyValue", (int)(Math.random()*370) +"px");
		

		
		request.getRequestDispatcher("mainJeux.jsp").forward(request, response);
		

		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
    public mainServlet() {
        super();
        
    }
}
