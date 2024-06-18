package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.notice_BoardDAO;
import Model.notice_BoardDTO;
import Model.reportTestDAO;
import Model.reportTestDTO;

@WebServlet("/reportPostServiceCon")
public class reportPostServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("===================reportPostServiceCon������]=========================");

		request.setCharacterEncoding("EUC-KR");

		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		int maxSize = 5 * 1024 * 1024;
		String encoding = "EUC-KR";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		Double lat = Double.parseDouble(multi.getParameter("lat"));
		Double lng = Double.parseDouble(multi.getParameter("lng"));
		String addr = multi.getParameter("addr");
		String fileName = null;
		if (multi.getFilesystemName("fileName") != null) {
			fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
		}
		System.out.println("(reportPostServiceCon������) title : " + title);
		System.out.println("(reportPostServiceCon������) lat :" + lat);
		System.out.println("(reportPostServiceCon������) lng :" + lng);
		System.out.println("(reportPostServiceCon������) �ѱ��ּ� : " + addr);
		System.out.println("(reportPostServiceCon������) fileName : " + fileName);

		//// ���� ���̺� ���ε�
		reportTestDTO dto = new reportTestDTO(lat, fileName, lng, addr);
		reportTestDAO dao = new reportTestDAO();
		
		int upCnt = dao.reportUpload(dto); // ���� �� ������ȣ�� �� �� ����!(�⺻���� 0�� ����־�) -> �ؿ��� ã���ִ� �˰��� �߰�
	
		/////////////// ���� -> ���� /////////////// 
		// ���������� ����
		notice_BoardDAO ndao = new notice_BoardDAO();
		notice_BoardDTO ndto = new notice_BoardDTO();
		ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>(); // ��� ���� ���
		ArrayList<reportTestDTO> array2 = new ArrayList<reportTestDTO>(); // �ݰ� ���� ���� ���
		array.clear();
		array2.clear();
		int mCnt = 0;
		int ckCnt = 0;
		System.out.println("��̻����� �ʱ갪 : " + array.size());
		System.out.println("���2������ �ʱ갪 : " + array2.size());
		System.out.println("�ڵ�ȭcnt �ʱ갪 : " + mCnt);
		System.out.println("üũcnt �ʱ갪 : " + ckCnt);
		System.out.println();

		if (upCnt > 0) {
			System.out.println("���� ���ε� ����");
			System.out.println();
			// (check�� 0)��밡���� ���� ����Ʈ
			array = dao.reportShow();
			System.out.println("check�� 0�� ��� ������ ����  = " + array.size());
			// �� ������ dto�� ���ε��� �������� ������ȣ �־��ֱ�
			for (int i = 0; i < array.size(); i++) {
				if ((array.get(i).getLat() - dto.getLat()) == 0 && (array.get(i).getLng() - dto.getLng()) == 0) {
					System.out.println("��ġ ��ǥ ����");
					dto.setReport_number(array.get(i).getReport_number());
					dto.setReport_date(array.get(i).getReport_date());
					dto.setNotice_check(array.get(i).getNotice_check());
				}
			}System.out.println();
			
			// �� ������ �ݰ� 500m ���� ������ ����
			// �� ������ ����, �浵
			double latX = dto.getLat();
			double lngY = dto.getLng();
			for (int i = 0; i < array.size(); i++) {
				double latA = array.get(i).getLat();
				double lngB = array.get(i).getLng();
				// ��� �����п��� �� �� ���� �Ÿ� ���ϱ�
				double cos = Math.cos(Math.toRadians(latA)) * Math.cos(Math.toRadians(latX))
						* Math.cos(Math.toRadians(lngY - lngB));
				double sin = Math.sin(Math.toRadians(latA)) * Math.sin(Math.toRadians(latX));
				double result = cos + sin;
				double distance = 6371 * Math.acos(result);
				//
//				System.out.println((i + 1) + "��° ���� Ȯ��==========");
//				System.out.println("acos�� �� ��� (-1��1���̾�� ��): " + result);
				System.out.println((i + 1) + "��° ������ ���� ���� ���� �Ÿ� : " + distance);
				System.out.println("===================");
				// 500m �̸��� �� ī��Ʈ
				if (distance < 0.5) { // ���⼭ �Ÿ� ����
					array2.add(array.get(i));
				}
			}System.out.println("���� �纸���� �Ÿ��� 500m ������ ������ ���� " + array2.size());
				

			if (array2.size() > 3) { // �������ͷ� �����Ϸ��� 3���� ��
				// ���� -> ����
				mCnt = dao.makeNotice(dto);
				System.out.println("����ȭ �ƴٸ� mCnt = 1 = " + mCnt);
				System.out.println();
				// ���� ��ȣ�� ������ ���� ��ȣ ã��
				int num  = ndao.report2notice(dto.getReport_number());
				System.out.println("�����ȣ�� �� ã�������� Ȯ�� : " + num);
				if (mCnt > 0) {
					System.out.println("���� ���ε� ����");
					for (int i = 0; i < array2.size(); i++) {				
						ckCnt = dao.noticeCheck(num, array2.get(i));
						if (ckCnt > 0) {
							System.out.println(i + "��° ���� check�� �ش� �����ȣ�� ���� ����");
						} else {
							System.out.println(i + "��° ����check�� �ش� �����ȣ�� ���� ����");
						}
					}
				} else {
					System.out.println("���� ���ε� ����");
				}
			}
		} else {
			System.out.println("���� ���ε� ����");
		}

		System.out.println("[=============================]");
		response.sendRedirect("reportPostWrite.jsp");
	}

}