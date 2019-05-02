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


@WebServlet("/home")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		int pages = 0;
		String input = "";
		String mode = "newsfeed";
		if (request.getParameter("input")!= null) {
			input = request.getParameter("input");
			mode = "search";
		}
		SolrConn solrConn = new SolrConn();
		String error = "";
		SetOfNews setOfNews = new SetOfNews();
		if (request.getParameter("pages")!=null) {
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}
		try {
			if (input!="") {
				setOfNews = solrConn.searchNews(input, pages);
				}
			else {
				setOfNews = solrConn.getNewfeed(pages);
			}
		} catch (SolrServerException e) {
			error = e.toString();
		}
		request.setAttribute("input", input);
		request.setAttribute("mode", mode);
		request.setAttribute("error", error);
		request.setAttribute("listOfNews", setOfNews);
		request.setAttribute("pages", pages);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/web/news.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
