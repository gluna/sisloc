package sisloc.controller;

import sisloc.dao.EntradaPecaDao;
import sisloc.dao.FornecedorDao;
import sisloc.dao.PecaDao;
import sisloc.modelo.EntradaPeca;
import sisloc.modelo.EntradaPecasDetalhe;
import sisloc.modelo.Peca;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EntradaPecaController {
	
	private EntradaPecaDao dao;
	private FornecedorDao fornecedordao;
	private PecaDao pecadao;
	private Result result;
	
	public EntradaPecaController(EntradaPecaDao dao, Result result, FornecedorDao fornecedordao,PecaDao pecadao){
		this.dao = dao;
		this.fornecedordao = fornecedordao;
		this.pecadao = pecadao;
		this.result = result;
	}
	
	@Path("/entradapeca/cadastrar")
	public void cadastrar(){
		result.include("fornecedorList", fornecedordao.listaTodos());
		result.include("pecaList", pecadao.listaTodos());
	}
	
	@Post
	@Path("/entradapeca/salvar")
	public void salvar(EntradaPeca entradapeca){
		try {
		     if(entradapeca!= null) {
		    	 for(EntradaPecasDetalhe detalhe : entradapeca.getPecas()){
		    		 Peca p = pecadao.selectById(detalhe.getPeca());
		    		 p.setQuantidade(p.getQuantidade()+detalhe.getQuantidade());
		    		 p.setValor(detalhe.getValorunitario());
		    		detalhe.setPeca(p); 
		    	 }
		    	 entradapeca.setFornecedor(fornecedordao.selectById(entradapeca.getFornecedor()));
		    	 
		    	 if(entradapeca.getId() == null) {
		    		 dao.salvar(entradapeca);
		    	 } else {
		    		 dao.atualizar(entradapeca);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/entradapeca/editar/{entradapeca.id}")
	public void editar(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    if(entradaPeca != null) {
	         result.include("entradapeca", entradaPeca);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/entradapeca/visualizar/{entradapecas.id}")
	public void visualizar(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    if(entradaPeca != null) {
	         result.include("entradapeca", entradaPeca);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/entradapeca/excluir/{entradapeca.id}")
	public void excluir(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    dao.excluir(entradaPeca);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	

}
