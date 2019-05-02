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
import javabean.SetOfNews;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pages = 0;
		String input = request.getParameter("input");
		if (request.getParameter("pages")!=null) {
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}
		SolrConn solrConn = new SolrConn();
		String error = "";
		SetOfNews newSearch = new SetOfNews();
		try {
			newSearch = solrConn.searchNews(input, pages);
			
		} catch (SolrServerException e) {
			error = e.toString();
		}
		request.setAttribute("error", error);
		request.setAttribute("newsfeed", newSearch);
		request.setAttribute("pages", pages);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/web/newsfeed.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
