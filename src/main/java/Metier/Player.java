package Metier;

public abstract class Player extends Character{

	private int experience = 0;
	


	@Override
	public String toString() {
		return  super.toString()+"," +" experience=" + experience   ;
	}

	public Player(String name ,int pv ) {
		super(name,pv);
	}

	@Override
	public void attack(Character Character) {
		if(this.getPv()>0) {
			
		if(Character.getPv()==0) {
			return ;
		}
		if(Character.getPv()<10) {
			Character.takeDamage(Character.getPv());
			augmenteExperience();
			return ;
		}
		if( Character.isAlive()) {
			Character.takeDamage(10);
			augmenteExperience();
		}

	}
	}
	
	public int getExperience() {
		return experience;
	}


	public void augmenteExperience() {
		if(experience==100) {
			return;
		}
		experience+=10;
	}
	
	
}
