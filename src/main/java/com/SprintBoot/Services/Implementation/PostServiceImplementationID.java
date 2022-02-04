package com.SprintBoot.Services.Implementation;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.SprintBoot.Model.Post;
import com.SprintBoot.Services.PostService;

@Service
public class PostServiceImplementationID implements PostService {

	
	private final Log log=LogFactory.getLog(getClass());
	@Override
	public List<Post> validation(List<Post> posts) throws NullPointerException {
		log.info("Servicio 2");
		
		for(Post post : posts) {
			if (post.getId() == 0) {
				throw new NullPointerException("El Id es nulo");
			}
		}
		return posts;
	}
}
