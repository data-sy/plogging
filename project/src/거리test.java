
public class �Ÿ�test {

	public static void main(String[] args) {
		

///////// ���� ���� ����Ǵ��� �׽�Ʈ
		// �����ͺ��̽��� ��� �ִ� ���� 8��
		double latX = 35.151478661308616;
		double lntY = 126.90916337163642;
		
		// ����ڰ� �Է¹޴� ����
		double latA = 35.151478661308616;
		double lntB = 126.90916337163642;
		
		double latA1 = 45.151478661308616;
		double lntB1 = 176.90916337163642;
		
		// �� ���� ���� �� �־�������
		System.out.println(Math.cos(Math.toRadians(latX)));
		System.out.println(Math.cos(Math.toRadians(lntY)));
		System.out.println();

		System.out.println("cos^3 ��� : " + Math.cos(Math.toRadians(latA))*Math.cos(Math.toRadians(latX))*Math.cos(Math.toRadians(lntY-lntB)));
		System.out.println("sin^2 ��� : " + Math.sin(Math.toRadians(latA))*Math.sin(Math.toRadians(latX)));
		System.out.println();
		
		double cos = Math.cos(Math.toRadians(latA))*Math.cos(Math.toRadians(latX))*Math.cos(Math.toRadians(lntY-lntB));
		double sin = Math.sin(Math.toRadians(latA))*Math.sin(Math.toRadians(latX));
		double result = cos+sin;
		System.out.println("������ 1�� ���� : " + result);
		double distance = 6371*Math.acos(cos+sin);
		System.out.println("����� distance�� 0 ���� : " + distance);
		double cos2 = Math.cos(Math.toRadians(latA1))*Math.cos(Math.toRadians(latX))*Math.cos(Math.toRadians(lntY-lntB1));
		double sin2 = Math.sin(Math.toRadians(latA1))*Math.sin(Math.toRadians(latX));
		double result2 = cos2+sin2;
		System.out.println("�ָ� 1���� ���� �� ���� : " + result2);
		double distance2 = 6371*Math.acos(cos2+sin2);
		System.out.println("�� distance�� ũ�� ���� : " + distance2);
		System.out.println();

		
//////// �����׽�Ʈ
			// ���� : �п� 
		double latx = 35.14988069548735;
		double laty = 126.91966681267044;
		
			// �Ÿ� 500 �� �ݳ��� 4���� : 35.15103328966069, 126.91399475344355
		double lata1 = 35.15103328966069;
		double latb1 = 126.91399475344355;
		
			// �Ÿ� 1000�� �ݳ��� 5����  : 35.15400923926062, 126.9096617050509
		double lata2 = 35.15400923926062;
		double latb2 = 126.9096617050509;
			
		double cos3 = Math.cos(Math.toRadians(lata1))*Math.cos(Math.toRadians(latx))*Math.cos(Math.toRadians(laty-latb1));
		double sin3 = Math.sin(Math.toRadians(lata1))*Math.sin(Math.toRadians(latx));
		double result3 = cos3+sin3;
		double distance3 = 6371*Math.acos(result3);
		System.out.println("�ݳ��� 4�������� �Ÿ� �� 500m = " + distance3);
		
		double cos4 = Math.cos(Math.toRadians(lata2))*Math.cos(Math.toRadians(latx))*Math.cos(Math.toRadians(laty-latb2));
		double sin4 = Math.sin(Math.toRadians(lata2))*Math.sin(Math.toRadians(latx));
		double result4 = cos4+sin4;
		double distance4 = 6371*Math.acos(result4);
		System.out.println("�ݳ��� 5�������� �Ÿ� �� 1000m = " + distance4);
		
		// �ϼ�!!
		

	}

}
