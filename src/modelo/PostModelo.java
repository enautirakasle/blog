package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Post;
import bean.Usuario;

public class PostModelo extends Conector{

	public Object selectAll() {

		// crear arrayList
		ArrayList<Post> posts = new ArrayList<Post>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from posts");
			while (rs.next()) {
				 Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitulo(rs.getString("titulo"));
				post.setCuerpo(rs.getString("cuerpo"));
				posts.add(post);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}

}
