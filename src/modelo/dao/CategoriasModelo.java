package modelo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import modelo.bean.Categoria;
import modelo.bean.Post;

public class CategoriasModelo extends Conector{
	
	public ArrayList<Categoria> selectAll() {

		// crear arrayList
		ArrayList<Categoria> categorias = new ArrayList<Categoria>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from categorias");
			while (rs.next()) {
				 Categoria categoria = new Categoria();
				 categoria.setId(rs.getInt("id_categoria"));
				 categoria.setNombre(rs.getString("nombre"));
				 categoria.setDescripcion(rs.getString("descripcion"));

				 categorias.add(categoria);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categorias;
	}

	public void insert(Categoria categoria) {
		// TODO Auto-generated method stub
		
	}

}
