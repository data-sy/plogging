package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.reportTestDAO;
import Model.reportTestDTO;

@WebServlet("/deleteReportServiceCon")
public class deleteReportServiceCon extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      System.out.println("================deleteReportServiceCon================");
      int report_number = Integer.parseInt(request.getParameter("report_number"));
      System.out.println("(deleteReportServiceCon������) ������ȣ�� �� ��� �Դ��� : " + report_number);
      reportTestDAO dao = new reportTestDAO();
      int cnt = dao.deleteReport(report_number);

      if(cnt > 0){
         System.out.println("���� ���� ����");
      }else{
         System.out.println("���� ���� ����");
      }
   }
}