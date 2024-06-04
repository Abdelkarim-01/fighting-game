package Metier;

public abstract class Character implements Comparable<Character>{

	private String name;
	private int pv;
	
	public Character(String name ,int pv) {
		if(pv<0) {
			throw new IllegalStateException("le pv ne peut pas etre inferieure a zero");
		}
		this.name=name;
		this.pv=pv;
	}
	
	public int getPv() {
		return pv;
	}
	
	public boolean isAlive() {
		if(pv>0)
			return true;
		return false;
	}
	
	public void takeDamage(int amount ) {
		pv -=amount;
	}
	
	public abstract void attack(Character Character ) ;
	
    @Override
    public int compareTo(Character other) {
        return Integer.compare(other.pv, this.pv); // Tri par ordre décroissant de pv 
    }

	public String toString() {
		return " name=" + name + ", pv=" + pv +" ";
	}
	
	
}
