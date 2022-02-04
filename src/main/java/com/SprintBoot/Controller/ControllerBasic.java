package com.SprintBoot.Controller;


import java.util.List;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.SprintBoot.Component.PostComponent;
import com.SprintBoot.Configuracion.Paginas;
import com.SprintBoot.Model.Post;


//import Configuracion.Paginas;
//import Model.Post;

@Controller
@RequestMapping("/home")
public class ControllerBasic {

  @Autowired
  private PostComponent _postComponet;

	@GetMapping(path = { "/postx", "/" })
	public String saludar(Model model) {
		model.addAttribute("posts", this._postComponet.getPosts());
		return "index";
	}

	@GetMapping(path = "/public")
	public ModelAndView post() {
		ModelAndView modelAndView = new ModelAndView("Paginas.HOME");
		modelAndView.addObject("posts", this._postComponet.getPosts());
		return modelAndView;

	}

	@GetMapping(path = { "/post" })
	public ModelAndView getPostIndividual(@RequestParam(defaultValue = "1", name = "id", required = false) int id) {
		ModelAndView modelAndView = new ModelAndView(Paginas.POST);
		List<Post> postFiltrado = this._postComponet.getPosts().stream().filter((p) -> {
			return p.getId() == id;
		}).collect(Collectors.toList());
		modelAndView.addObject("post", postFiltrado.get(0));
		return modelAndView;
	}

	@GetMapping(path={"/postNew"})
	public ModelAndView getForm() {
		return new ModelAndView("form").addObject("post", new Post());
	}  

	@PostMapping(path={"/addNewPost"})
	public String addNewPost(Post post, Model model) {
		List<Post> posts = this._postComponet.getPosts();
		posts.add(post);
		model.addAttribute("posts", posts);
		return "index";
	}
}
