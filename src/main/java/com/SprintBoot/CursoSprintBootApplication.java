package com.SprintBoot;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

import com.SprintBoot.Component.PostComponent;

import com.SprintBoot.Model.Conexion;
import com.SprintBoot.Services.PostService;

@SpringBootApplication
public class CursoSprintBootApplication implements CommandLineRunner {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Qualifier("beanConexion")
	private Conexion conexion;

	@Autowired
	@Qualifier("com.SprintBoot.Component")
	public PostComponent postComponet;

	@Autowired
	@Qualifier("ServicioDecorado")
	public PostService postService;

	public static void main(String[] args) {
		SpringApplication.run(CursoSprintBootApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		jdbcTemplate.execute("insert into permiso(Nombre) values ('Costos')");

	}

}
