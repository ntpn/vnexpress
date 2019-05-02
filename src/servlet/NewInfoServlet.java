package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrServerException;

import connection.SolrConn;
import javabean.New;


@WebServlet("/newinfo")
public class NewInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getParameter("id");
		SolrConn solrConn = new SolrConn();
		String error = "";
		New anew = new New();
		try {
			anew = solrConn.getNewByID(id);
		} catch (SolrServerException e) {
			error = e.toString();
		}
		request.setAttribute("error", error);
		request.setAttribute("anew", anew);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/web/newinfo.jsp");
		dispatcher.forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
