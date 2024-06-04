package Metier;

public class Wizard extends Player{

	private int mp ;

	public Wizard(String name, int pv, int mp) {
		super(name, pv);
		this.mp = mp;
	}

	@Override
	public void attack(Character Character) {
		if(this.getPv()>0) {
			
		if(Character.getPv()==0) {
			return ;
		}
		if(mp>=10 && Character.getPv()<10) {
			Character.takeDamage(Character.getPv());
			this.augmenteExperience();
			return ;
		}
		 if(mp>=10 && Character.isAlive()) {
			 Character.takeDamage(10);
			 this.augmenteExperience();
			 mp-=10;
		 }
		}
	}

	@Override
	public String toString() {
		return  super.toString() + "mp=" + mp ;
	}
	
	
	
}
