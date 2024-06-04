package Metier;



public class Enemy extends Character{
	
	private Loot loot;
	
	public Enemy(String name, int pv,Loot loot) {
		super(name, pv);
		this.loot=loot;
	}

	@Override
	public void attack(Character Character) {
		if(this.getPv()>0) {
		if(Character.getPv()<10) {
			Character.takeDamage(Character.getPv());
			return ;
		}
			
		Character.takeDamage(5);
		
	} 
	}
	
	

}
