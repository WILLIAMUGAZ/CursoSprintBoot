package com.SprintBoot.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.SprintBoot.Model.Post;


public interface PostService {

	public List<Post> validation(List<Post> posts) throws NullPointerException;
	
}
