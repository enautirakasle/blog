package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.CategoriasModelo;
import modelo.dao.UsuarioModelo;

/**
 * Servlet implementation class categorias
 */
@WebServlet("/categorias")
public class categorias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public categorias() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setAttribute("navBar", "/templates/parts/navBar.jsp");
		
		CategoriasModelo cm = new CategoriasModelo();
		request.setAttribute("categorias", cm.selectAll());
		request.setAttribute("content", "/categorias/listado.jsp");
		
		request.getRequestDispatcher("templates/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
