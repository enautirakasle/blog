package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONStringer;

import jdk.nashorn.api.scripting.JSObject;
import modelo.dao.PostModelo;

/**
 * Servlet implementation class ApiPosts
 */
@WebServlet("/api/posts")
public class ApiPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiPosts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostModelo pm = new PostModelo();
		
		String postJsonString = JSONStringer.valueToString(pm.selectAll());
		String callBack = request.getParameter("callback");
		
		//System.out.println(postJsonString);
		PrintWriter out = response.getWriter();
		//response.setHeader("Access-Control-Allow-Origin","*"); //jsonp erantzuna denez ez da behar
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.print(callBack+"("+postJsonString+");");
//		out.print(postJsonString);
		out.flush();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
