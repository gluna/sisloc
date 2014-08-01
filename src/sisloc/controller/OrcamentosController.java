package sisloc.controller;

import br.com.caelum.vraptor.Resource;


@Resource
public class OrcamentosController {

	/*private OrcamentoDao dao;
	private Result result;
	private ServletContext context;
	private ProdutoDao produtodao;
	private ClienteDao clientedao;
	private HttpServletResponse response;
	
	public OrcamentosController(OrcamentoDao dao, Result result,final ServletContext context, 
			ClienteDao clientedao, ProdutoDao produtodao, HttpServletResponse response){
		this.dao = dao;
		this.result = result;
		this.context = context;
		this.produtodao = produtodao;
		this.clientedao = clientedao;
		this.response = response;
	}
	
	@Path("/orcamentos/cadastrar")
	public List<Produto> cadastrar(){
		List<Produto> t = produtodao.listaTodos();
		return t;
	}
	
	@Post
	@Path("/orcamentos/salvar")
	public void salvar(Orcamento orcamento){
		try {
		     if(orcamento != null) {
		    	 for(OrcamentoDetalhe od : orcamento.getOrcamentodetalhe() ){
		    		 od.setProduto(produtodao.selectById(od.getProduto()));
		    	 }

		    	 if(orcamento.getId() == null) {
		    		 dao.salvar(orcamento);
		    	 } else {
		    		 dao.atualizar(orcamento);
	             }
	          }
		     result.include("orcamento", orcamento);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/orcamentos/editar/{orcamento.id}")
	public void editar(Orcamento orcamento){
		orcamento = dao.selectById(orcamento);
	    if(orcamento != null) {
	         result.include("orcamento", orcamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/orcamentos/visualizar/{orcamento.id}")
	public void visualizar(Orcamento orcamento){
		orcamento = dao.selectById(orcamento);
	    if(orcamento != null) {
	         result.include("orcamento", orcamento);
	    }
	    //result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/orcamentos/excluir/{orcamento.id}")
	public void excluir(Orcamento orcamento){
		orcamento = dao.selectById(orcamento);
	    dao.excluir(orcamento);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/orcamentos/consultar")
	public List<Orcamento> consultar(){
		List<Orcamento> t = dao.listaTodos();
		return t;
	}
	
	@Path("/orcamentos/getclientes")
	public void getclientes(){
		List<Cliente> clientes =  clientedao.listaTodos();
		result.use(Results.json()).withoutRoot().from(clientes).serialize();  
	}
	
	@Path({"/orcamentos/report/{orcamento.id}", "/orcamentos/report/"}) 
	public void pdfReport(Orcamento orcamento) {
		if(orcamento != null) {
			try{
				orcamento = dao.selectById(orcamento);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "ORCAMENTO_ID", orcamento.getId() );
				parametros.put("PATH", context.getRealPath("/images/"));
				
				
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/orcamentoreport.jasper"), parametros, SislocUtils.getConnection());

				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		            
							
			}catch(Exception e){e.printStackTrace();}
			
		}
		result.include("orcamento", orcamento); 
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/orcamentos/getprecos/{produto.id}")
	public void getprecos(Long p){
		Produto prod = new Produto();
		prod.setId(p);
		List<Preco> precos = produtodao.selectById(prod).getPrecos();
		result.use(Results.json()).withoutRoot().from(precos).serialize();  
	}
	
	@Path("/orcamentos/consultaorcamento")
	public List<Orcamento> consultaorcamento(Orcamento orcamento){
		List<Orcamento> t = dao.consultaorcamento(orcamento);
		return t;
	}*/
	
}
