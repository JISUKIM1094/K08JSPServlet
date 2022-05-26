package common;

public class Person {

//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}
	
	
	//DTO (데이터 트랜스퍼 오브젝트), VO(밸류오브젝트) 클래스 =순수하게 데이터 저장기능만 있는 클래스
	private String name;
	private int age;
	public Person() {}
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
