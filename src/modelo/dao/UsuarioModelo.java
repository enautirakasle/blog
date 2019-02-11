package modelo.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import modelo.bean.Usuario;
/**
 * Clase UsurioModelo creada para el acceso a la BBDD
 * de la tabla usuarios
 * @author Enaut Agirre
 *
 */
public class UsuarioModelo extends Conector {

	/**
	 * Devuelve todos los usuarios
	 * 
	 * @return arrayList de Usuario-s
	 */
	public ArrayList<Usuario> selectAll() {
		// crear arrayList
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from usuarios");
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));

				usuarios.add(usuario);
			}
			return usuarios;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}
	
	/**
	 * Devuelve todos los usuairos ordenados por un campo concreto
	 * 
	 * @param campo String nombre de la columna de la BBDD
	 * @return ArrayList de Usuario-s
	 */
	public ArrayList<Usuario> selectAllOrderBy(String campo) {
		// crear arrayList
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from usuarios order by " + campo);
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));

				usuarios.add(usuario);
			}
			return usuarios;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}

	/**
	 * Selecciona el usuario con el id que se le pasa
	 * 
	 * @param id int del usuario que se quiere obtener
	 * @return objeto usuario
	 */
	public Usuario select(int id) {
		// select * from usuarios where id = 7
		try {
			PreparedStatement pst = super.conexion.prepareStatement("select * from usuarios where id = ?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));
				
				return usuario;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * Elimina el usuairo que tiene el id que se le pasa
	 * 
	 * @param id int elimina la fila de la tabla usuarios con el id recibido.
	 */
	public void delete(int id) {
		// delete from usuarios where id = 6
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("delete from usuarios where id = ?");
			pst.setInt(1, id);

			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Cambia el usuario con los datos de usuairo que se le pasa
	 * 
	 * @param usuario cambia la fila del usuario recibido.
	 */
	public void update(Usuario usuario) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement(
					"update usuarios set nombre=?, apellido=?, dni=?, activo=? where id=?");
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getApellido());
			pst.setString(3, usuario.getDni());
			pst.setBoolean(4, usuario.isActivo());
			pst.setInt(5, usuario.getId());

			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Inserta el usuario que se le pasa
	 * 
	 * @param usuario Usuario, inserta el usuario recibido en la tabla usuarios
	 */
	public void insert(Usuario usuario) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement(
					"INSERT INTO usuarios (nombre, apellido, dni, activo) values(?, ?, ?, ?)");
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getApellido());
			pst.setString(3, usuario.getDni());
			pst.setBoolean(4, usuario.isActivo());

			pst.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Selecciona usuairos con el nombre que se le pasa
	 * @param nombre String un nombre.
	 * @return ArrayList de Usuario-s con el nombre recibido.
	 */
	public ArrayList<Usuario> selectPorNombre(String nombre) {
		// crear arrayList
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from usuarios where nombre = '" + nombre + "'");
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));
				
				usuarios.add(usuario);
			}
			return usuarios;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}

	
	/**
	 * Selecciona usuarios que contengan "cadena" en el apellido
	 * 
	 * @param cadena String recibe un string
	 * @return ArrayList de Usuario-s con el substring cadena en apellido
	 */
	public ArrayList<Usuario> selectContieneEnApellido(String cadena) {
		// SELECT * FROM `usuarios` WHERE apellido like '%za%'
		// crear arrayList
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from usuarios where apellido like '%" + cadena + "%'");
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));

				usuarios.add(usuario);
			}
			return usuarios;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}

	/**
	 * Devuelve el usuario con el dni que se le pasa
	 * 
	 * @param dni String dni
	 * @return Usuario con el dni recibido
	 */
	public Usuario selectPorDni(String dni) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("select * from usuarios where dni = ?");
			pst.setString(1, dni);
			ResultSet rs = pst.executeQuery();
			// Statement st = super.conexion.createStatement();
			// ResultSet rs = st.executeQuery("select * from usuarios where dni
			// = '" + dni + "'");

			if (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));

				return usuario;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;

	}

	public Usuario selectPorNombreUsuario(String nombreUsuario) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("select * from usuarios where usuario = ?");
			pst.setString(1, nombreUsuario);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setActivo(rs.getBoolean("activo"));
				usuario.setUsuario(rs.getString("usuario"));
				usuario.setContrasena(rs.getString("contrasena"));

				return usuario;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


}