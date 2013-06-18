package sisloc.controller;

import sisloc.dao.ClienteDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class TelefonesClientesController {

//	private ClienteDao dao;
//	private Result result;
	
	public TelefonesClientesController(ClienteDao dao, Result result){
		//this.dao = dao;
		//this.result = result;
	}
	
	@Path("/telefonesclientes/cadastrar")
	public void cadastrar(){
	}
	
}
