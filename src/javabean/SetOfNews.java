package javabean;

import java.util.ArrayList;

public class SetOfNews {
	private long num;
	ArrayList<New> set = new ArrayList<>();
	
	public SetOfNews() {
		super();
	}

	public SetOfNews(long num, ArrayList<New> set) {
		super();
		this.num = num;
		this.set = set;
	}

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public ArrayList<New> getSet() {
		return set;
	}

	public void setSet(ArrayList<New> set) {
		this.set = set;
	}
	
}
