package com.SprintBoot.Services.Implementation;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.SprintBoot.Model.Post;
import com.SprintBoot.Services.PostService;


@Service
public class PostServiceImplementation implements PostService {

	private final Log log=LogFactory.getLog(getClass());
	
	@Override
	public List<Post> validation(List<Post> posts) throws NullPointerException {
	log.info("Servicio 1");	
		
		// TODO Auto-generated method stub
		for(Post post : posts) {
			if (post.getTitulo()==null) {
				throw new NullPointerException("El titulo es nulo");
			}
		}
		return posts;
	}
	
	

}
