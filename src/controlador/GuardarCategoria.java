package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.bean.Categoria;
import modelo.dao.CategoriasModelo;

/**
 * Servlet implementation class GuardarCategoria
 */
@WebServlet("/guardarcategoria")
public class GuardarCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarCategoria() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//parametroak jaso
		String nombre = request.getParameter("categoria");
		String descripcion = request.getParameter("descripcion");
		
		Categoria categoria = new Categoria();
		categoria.setNombre(nombre);
		categoria.setDescripcion(descripcion);

		CategoriasModelo cm = new CategoriasModelo();
		cm.insert(categoria);
		
		
		
		response.sendRedirect("categorias");
	}

}
