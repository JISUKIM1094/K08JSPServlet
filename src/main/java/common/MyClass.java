package common;

public class MyClass {

//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}

	
	
public static int myFunc(int a, int b) { //a~b 누적 합
		int sum=0;
		for (int i=a; i<=b; i++) sum +=i;
		return sum;
	}
}
