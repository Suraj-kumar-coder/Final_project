package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub


			try {
			
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id,fullname,dob,qualification,specialist,email,mobno,password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			if(dao.updateDoctor(d))
			{
				
				session.setAttribute("succMsg", "Update Detail successfully.. ");
				resp.sendRedirect("admin/doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg", "something error");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		{
			
		}
		
		
	}
	
}
