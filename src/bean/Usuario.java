package bean;

import java.util.ArrayList;
import java.util.Date;
/**
 * Clase usuario creada para crear la aplicación de un blog,
 * el objeti o es mostrar las caracteríticas principales de
 * la programación orientada a objetos
 * @author ikaslea
 *
 */
public class Usuario extends Persona{
	
	//atributos
	private boolean activo;
	
	private ArrayList<Pagina> paginas;
	private ArrayList<Post> posts;
	
	public Usuario() {
		super();
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


	public Usuario(String nombre){
		super(nombre);
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Usuario [id=" + super.id + ", dni=" + super.getDni() + ", nombre=" + this.nombre + ", apellido=" + this.apellido + ", activo="
				+ this.activo + "]";
	}
	
	
}
