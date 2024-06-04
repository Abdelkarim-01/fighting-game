package Metier;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class main {

	public static ArrayList<Player> list_players;
	private static boolean hasPlayerAlive(List<Player> players) {
		for(Player player : players) {
			if(player.isAlive())
				return true;
		}
		return false;
	}
	
	public static void main(String[] args) {
		
		list_players=new ArrayList<Player>();
		Knight play1=new Knight("Knight", 350);
		Wizard play2=new Wizard("Wizard", 150,100);
		list_players.add(play1);
		list_players.add(play2);
		
		Enemy enemy=new Enemy("enemy",1000,Loot.POTION);
		while((play1.isAlive() || play2.isAlive()) && enemy.isAlive()) {
			
			play1.attack(enemy);
			enemy.attack(play1);
			play2.attack(enemy);
			enemy.attack(play2);
		}
		Collections.sort(list_players);
		System.out.println(list_players.get(0).toString());
		System.out.println(list_players.get(1).toString());
		System.out.println(enemy.toString());
		
	}

}
