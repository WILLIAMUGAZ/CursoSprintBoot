package com.SprintBoot.Model;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.beans.factory.annotation.Qualifier;

public class Conexion {
/* metodo beans */
	@Autowired
	@Qualifier("beanUsuario")
	private Usuario usuario;

	private String db;
	private String url;

	public String getDb() {
		return db;
	}

	public void setDb(String db) {
		this.db = db;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
