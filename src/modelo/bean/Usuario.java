package modelo.bean;

import java.util.ArrayList;
import java.util.Date;
/**
 * Clase usuario creada para crear la aplicación de un blog,
 * el objeti o es mostrar las caracteríticas principales de
 * la programación orientada a objetos
 * @author ikaslea
 *
 */
public class Usuario{
	
	//atributos
	private int id;
	private String dni;
	private String nombre;
	private String apellido;
	private boolean activo;
	private String usuario;
	private String contrasena;


	private ArrayList<Pagina> paginas;
	private ArrayList<Post> posts;
	
	public Usuario() {
	}
	
	public Usuario(String nombre){
		this.nombre=nombre;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getDni() {
		return dni;
	}


	public void setDni(String dni) {
		this.dni = dni;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public boolean isActivo() {
		return activo;
	}


	public void setActivo(boolean activo) {
		this.activo = activo;
	}


	public ArrayList<Pagina> getPaginas() {
		return paginas;
	}


	public void setPaginas(ArrayList<Pagina> paginas) {
		this.paginas = paginas;
	}


	public ArrayList<Post> getPosts() {
		return posts;
	}


	public void setPosts(ArrayList<Post> posts) {
		this.posts = posts;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}



	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", dni=" + getDni() + ", nombre=" + this.nombre + ", apellido=" + this.apellido + ", activo="
				+ this.activo + "]";
	}

	public boolean contrasenaCorrecta(String contrasena2) {
		if(this.contrasena.equals(contrasena2)) return true;
		return false;
		
	}
	
	
}
