package com.SprintBoot.Services.Implementation;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.SprintBoot.Model.Post;
import com.SprintBoot.Services.PostService;


@Service("ServicioDecorado")
@Scope("singleton")
public class PostServiceDecoradoImplementation implements PostService {

	private final Log log=LogFactory.getLog(getClass());
	
	@Autowired
	private PostServiceImplementation postServiceImplementation;
	
	@Autowired
	private PostServiceImplementationID postServiceImplementationID;
	
	
	@Override
	public List<Post> validation(List<Post> posts)throws NullPointerException {
		log.debug(posts);
		posts=postServiceImplementation.validation(posts);
		posts=postServiceImplementationID.validation(posts);
		for(Post post : posts) {
			if (post.getDescripcion() == null) {
				
				throw new NullPointerException("El descripcion es nulo");
			}
		}
		for(Post post : posts) {
			if (post.getFecha()==null) {
				throw new NullPointerException("El fecha es nulo");
			}
		}
		
		return posts;
		}
	}

	
	

