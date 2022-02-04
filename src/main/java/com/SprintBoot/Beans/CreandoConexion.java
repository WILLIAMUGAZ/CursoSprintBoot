package com.SprintBoot.Beans;


import java.sql.DriverManager;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import com.SprintBoot.Model.Conexion;
import com.SprintBoot.Model.Usuario;
import com.mysql.jdbc.Driver;



@Component
public class CreandoConexion {
	
	@Bean(name="beanUsuario")
	public Usuario getUsuario() {
		return new Usuario();
	}
	
	
	@Bean(name="beanConexion")
	public Conexion getConexion (){
		Conexion conexion = new Conexion();
		conexion.setDb("mysql");
		conexion.setUrl("localhost");
		return conexion;
	}
	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource datasource= new DriverManagerDataSource();
		datasource.setDriverClassName("com.mysql.jdbc.Driver");
		datasource.setUrl("jdbc:mysql://localhost:3306/blog?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
		datasource.setUsername("GALILEO");
		datasource.setPassword("root1234");
		return datasource;
	}
	
}
