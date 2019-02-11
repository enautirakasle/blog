package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.bean.Usuario;
import modelo.dao.UsuarioModelo;

/**
 * Servlet implementation class Loguear
 */
@WebServlet("/loguear")
public class Loguear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loguear() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served get: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreUsuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");
		
		UsuarioModelo um = new UsuarioModelo();
		Usuario usuario = um.selectPorNombreUsuario(nombreUsuario);
		
		if (usuario!=null && usuario.contrasenaCorrecta(contrasena)) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogueado", usuario);
			
			response.sendRedirect(request.getContextPath()+"/admin/posts");
//			//preparar vista
//			request.setAttribute("navBar", "/tempaltes/parts/navBar.jsp");
//			PostModelo pm = new PostModelo();
//			request.setAttribute("posts", pm.selectAll());
//			
//			request.getRequestDispatcher("templates/main.jsp");
		}else {
			response.sendRedirect("inicio");
		}
	}

}
