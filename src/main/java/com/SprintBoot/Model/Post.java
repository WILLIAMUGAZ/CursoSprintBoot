package com.SprintBoot.Model;

import java.util.Date;

public class Post {

	private int id;
	private String descripcion;
	private String urlImag="D:/LOGOS/https://www.google.com/search?rlz=1C1ALOY_esPE968PE968&sxsrf=AOaemvLlnhLdZOotSKGDoKvKmVGxueJ5yA:1643153696163&source=univ&tbm=isch&q=IMAGENES+PNG+AVATAR&fir=VbShd6p9FkpJ9M%252CkAUhKNBMH2Z_BM%252C_%253B6bA31TxGyI4rrM%252ChH2NR5mmo7syJM%252C_%253Bk_82E3jhIcr9xM%252COr0cIFLoYCIVVM%252C_%253B0L_4GPwbsGJl3M%252ChH2NR5mmo7syJM%252C_%253BcDfvfW3GAX3y8M%252Cm0vThzSKn43iyM%252C_%253BkoR5k7ff7vqzMM%252Cs9V_Q7-xpVLXdM%252C_%253BunaObTIzlO2TxM%252CWyyhyDDJ4ocpqM%252C_%253BGFC_lfvb2meHeM%252C86g_vqEXCp1mnM%252C_%253ByOtkbrQuOOYhTM%252CIJZuUe81vUIdsM%252C_%253BzUe49gUP61Wa6M%252CIgRli0xW5VXvjM%252C_%253BfjVIC3iyqpzlEM%252CTmBuyZJMm1oovM%252C_%253BqJAogwNtQl7AIM%252CwMhJgF7aHtbIRM%252C_%253BWReOSudGdc9E1M%252CIgRli0xW5VXvjM%252C_%253BvXrDmhwKErhxUM%252CkAUhKNBMH2Z_BM%252C_%253B4gxP8uYOp-LtEM%252CIgRli0xW5VXvjM%252C_&usg=AI4_-kTIK-RX17ygGaZ-hE6JZkZFOTMlUQ&sa=X&ved=2ahUKEwjSzvvCiM71AhXFIbkGHdhiANsQjJkEegQIBhAC&biw=1920&bih=947&dpr=1#imgrc=GFC_lfvb2meHeM";
	private Date fecha=new Date();
	private String titulo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUrlImag() {
		return urlImag;
	}

	public void setUrlImag(String urlImag) {
		this.urlImag = urlImag;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Post() {

	}

	public Post(int id, String descripcion, String urlImag, Date fecha, String titulo) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.urlImag = urlImag;
		this.fecha = fecha;
		this.titulo = titulo;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", descripcion=" + descripcion + ", urlImag=" + urlImag + ", fecha=" + fecha
				+ ", titulo=" + titulo + "]";
	}

}
