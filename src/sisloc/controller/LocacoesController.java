package sisloc.controller;

import br.com.caelum.vraptor.Resource;

@Resource
public class LocacoesController {
	
	/*private LocacaoDao dao;
	private Result result;
	//private ProdutoDao produtodao;
	private ServletContext context;
	private ClienteDao clientedao;
	private OrcamentoDao orcamentodao;
	private HttpServletResponse response;
	
	public LocacoesController(LocacaoDao dao, Result result, ProdutoDao produtodao,ServletContext context, 
			ClienteDao clientedao,OrcamentoDao orcamentodao, HttpServletResponse response){
		this.dao = dao;
		this.result = result;
		this.produtodao = produtodao;
		this.context = context;
		this.clientedao = clientedao;
		this.orcamentodao = orcamentodao;
		this.response = response;
	}
	
	@Path("/locacoes/cadastrar")
	public List<Produto> cadastrar(){
		List<Produto> t = produtodao.listaTodos();
		return t;
	}
	
	@Path("/locacoes/editar")
	public List<Produto> editar(){
		List<Produto> t = produtodao.listaTodos();
		return t;
	}
	
	@Post
	@Path("/locacoes/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 boolean ok = true;
		    	 if (locacao.getLocacaodetalhe() == null){
		    		 JOptionPane.showMessageDialog(null,"verifique os itens");
		    	 }else{
			    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
			    		 Produto p = produtodao.selectById(ld.getProduto());
			    		 if(p.getQuantidade()< ld.getQuantidade()){
			    			 ok = false;
			    		 }
			    	 }
		    	 
		    	 if(ok){
			    	 Double valortotal = 0.0;
			    	 if (locacao.getDescontopercent() == null){
			    		 locacao.setDescontopercent(0.0);
			    	 }
			    	 if (locacao.getDescontovalor() == null){
			    		 locacao.setDescontovalor(0.0);
			    	 }
			    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
			    		 ld.setProduto(produtodao.selectById(ld.getProduto()));
			    		 Produto p = produtodao.selectById(ld.getProduto());
			    		 p.setQuantidade(p.getQuantidade()-ld.getQuantidade());
			    		 valortotal = valortotal+(ld.getPreco()*ld.getQuantidade());
			    	 }
			    	 locacao.setValortotal(valortotal);
			    	 Double desconto = ((valortotal/100)*locacao.getDescontopercent());
			    	 valortotal = valortotal-desconto;
			    	 locacao.setValorfinal(valortotal-locacao.getDescontovalor());
			    	 if(locacao.getPagamentos() != null){
				    	 for(Pagamento p : locacao.getPagamentos()){
				    		 p.setTipo("E");
				    		 p.setDescricao("Pagamento Locação");
				    	 }
			    	 }
			    	 locacao.setCliente(clientedao.selectById(locacao.getCliente()));
			    	 locacao.setStatus("A");
			    	 if(locacao.getId() == null) {
			    		 dao.salvar(locacao);
			    	 } else {
			    		 dao.atualizar(locacao);
		             }
		    	 }else{
		    		 JOptionPane.showMessageDialog(null,"verifique as quantidades");
		    	 } 
	          }
		     }
		     result.include("locacao", locacao);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
			System.out.println(e.getMessage());
		}
	}

	@Post
	@Path("/locacoes/salvaredicao")
	public void salvaredicao(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 boolean ok = true;

		    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
		    		 Produto p = produtodao.selectById(ld.getProduto());
		    		 if(p.getQuantidade()< ld.getQuantidade()){
		    			 ok = false;
		    		 }
		    	 }

		    	 if(ok){
			    	 Double valortotal = 0.0;
			    	 if (locacao.getDescontopercent() == null){
			    		 locacao.setDescontopercent(0.0);
			    	 }
			    	 if (locacao.getDescontovalor() == null){
			    		 locacao.setDescontovalor(0.0);
			    	 }
			    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
			    		 ld.setProduto(produtodao.selectById(ld.getProduto()));
			    		 if(ld.getId() == null){
			    		   Produto p = produtodao.selectById(ld.getProduto());
			    		   p.setQuantidade(p.getQuantidade()-ld.getQuantidade());
			    		 }
			    		 valortotal = valortotal+(ld.getPreco()*ld.getQuantidade());
			    	 }
			    	 locacao.setValortotal(valortotal);
			    	 Double desconto = ((valortotal/100)*locacao.getDescontopercent());
			    	 valortotal = valortotal-desconto;
			    	 locacao.setValorfinal(valortotal-locacao.getDescontovalor());
			    	 if(locacao.getPagamentos() != null){
				    	 for(Pagamento p : locacao.getPagamentos()){
				    		 p.setTipo("E");
				    		 p.setDescricao("Pagamento Locação");
				    	 }
			    	 }
			    	 locacao.setCliente(clientedao.selectById(locacao.getCliente()));
			    	 locacao.setStatus("A");
			    	 if(locacao.getId() == null) {
			    		 dao.salvar(locacao);
			    	 } else {
			    		 dao.atualizar(locacao);
		             }
		    	 }else{
		    		 JOptionPane.showMessageDialog(null,"verifique as quantidades");
		    	 } 
	          }
		     result.include("locacao", locacao);
		     result.redirectTo(this.getClass()).editar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
			System.out.println(e.getMessage());
		}
	}

	
	@Post
	@Path("/locacoes/salvardevolucao")
	public void salvardevolucao(Locacao locacao){
		try {
			List<DevolucaoLocacao> devolucoes = locacao.getDevolucaolocacao();
			locacao = dao.selectById(locacao);
		     if(locacao != null) {
		    	 for(DevolucaoLocacao dl : devolucoes ){
		    		 if(dl.getId() == null){
		    			 dl.setProduto(produtodao.selectById(dl.getProduto()));
			    		 locacao.getDevolucaolocacao().add(dl);
		    		 }
		    	 }
		    	 if(locacao.getId() == null) {
		    		 dao.salvar(locacao);
		    	 } else {
		    		 dao.atualizar(locacao);
	             }
	          }
		     result.include("locacao", locacao);
		     result.redirectTo(this.getClass()).devolucao(locacao);
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}

	
	@Path("/locacoes/editar/{locacao.id}")
	public void editar(Locacao locacao){
		locacao = dao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    result.redirectTo(this.getClass()).editar();
	}
	
	@Path("/locacoes/visualizar/{locacao.id}")
	public void visualizar(Locacao locacao){
		locacao = dao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    //result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/excluir/{locacao.id}")
	public void excluir(Locacao locacao){
		locacao = dao.selectById(locacao);
	    dao.excluir(locacao);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
/*	@Path("/locacoes/excluirdetalhelocacao/{locacaodetalhe.id}")
	public void excluirdetalhelocacao(LocacaoDetalhe locacaodetalhe){
		locacaodetalhe = dao.buscaLocacaoDetalhe(locacaodetalhe);
		Produto p = produtodao.selectById(locacaodetalhe.getProduto());
	    p.setQuantidade(p.getQuantidade()+locacaodetalhe.getQuantidade());
	    	
	}
	
	@Path("/clientes/consultar")
	public List<Locacao> consultar(){
		List<Locacao> t = dao.listaTodos();
		return t;
	}
	
	@Path("/locacoes/getprecos/{produto.id}")
	public void getprecos(Long p){
		Produto prod = new Produto();
		prod.setId(p);
		List<Preco> precos = produtodao.selectById(prod).getPrecos();
		result.use(Results.json()).withoutRoot().from(precos).serialize();  
	}
	
	@Path("/locacoes/getclientes")
	public void getclientes(){
		List<Cliente> clientes =  clientedao.listaTodos();
		result.use(Results.json()).withoutRoot().from(clientes).serialize();  
	}
	
	@Path({"/locacoes/report/{locacao.id}", "/locacoes/report/"}) 
	public void pdfReport(Locacao locacao) {
		if(locacao != null) {
			try{
				locacao = dao.selectById(locacao);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "LOCACAO_ID", locacao.getId() );
				parametros.put("PATH", context.getRealPath("/images/"));
				parametros.put("SUBREPORT_DIR", context.getRealPath("/WEB-INF/classes/sisloc/report/template/"));
				 
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/contratoreport.jasper"), parametros, SislocUtils.getConnection());
				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		        
			}catch(Exception e){e.printStackTrace();}
			
		}
		result.include("locacao", locacao);
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/consultalocacao")
	public List<Locacao> consultalocacao(Locacao locacao){
		List<Locacao> t = dao.consultalocacao(locacao);
		return t;
	}
	
	@Path("/locacoes/importarorcamento/{locacao.id}")
	public void importarorcamento(Locacao locacao){
		Orcamento orcamento = new Orcamento();
		orcamento.setId(locacao.getId());
		orcamento = orcamentodao.selectById(orcamento);
		locacao = new Locacao();
		locacao.setDtinicio(orcamento.getInicio());
		locacao.setDtfim(orcamento.getFim());
		locacao.setObs(orcamento.getObs());
		locacao.setFrete(orcamento.getFrete());
		List<LocacaoDetalhe> detalhes = new ArrayList<LocacaoDetalhe>();
		for(OrcamentoDetalhe det : orcamento.getOrcamentodetalhe()){
			LocacaoDetalhe locdet = new LocacaoDetalhe();
			locdet.setPreco(det.getPreco());
			locdet.setProduto(det.getProduto());
			locdet.setQuantidade(det.getQuantidade());
			detalhes.add(locdet);
		}
		locacao.setLocacaodetalhe(detalhes);
		result.include("locacao", locacao);
		result.redirectTo(this.getClass()).cadastrar();
		
	}
	
	@Path("/locacoes/devolucao/{locacao.id}")
	public void devolucao(Locacao locacao){
		locacao = dao.selectById(locacao);
		result.include("locacao", locacao);
	}	
	
	@SuppressWarnings("deprecation")
	@Path("/locacoes/locacoesperiodo") 
	public void locacoesperiodo(Date inicio, Date fim) {
			try{
				//List<Pagamento> pagamentos = dao. selectById(locacao);
				Map<String, Object> parametros = new HashMap<String, Object>();
				if(inicio == null || fim == null){
					inicio = new Date(1);
					fim = new Date("31/12/2100");
				}
				
				parametros.put( "DT_INICIO", inicio );
				parametros.put( "DT_FIM", fim );
				parametros.put("PATH", context.getRealPath("/images/"));
				 
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/reportlocacoes.jasper"), parametros, SislocUtils.getConnection());
				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		        
			}catch(Exception e){e.printStackTrace();}

    	result.permanentlyRedirectTo(this.getClass()).locacoesreport();
	}
	
	@Path("/locacoes/locacoesreport")
	public void locacoesreport(){
		
	}
	
	@Path("/locacoes/fechamentolocacao/{locacao.id}")
	public Locacao fechamentolocacao(Locacao locacao){
		locacao = dao.selectById(locacao);
		if(locacao.getStatus().equals("A")){
 		locacao.setStatus("F");
		Long dias = (locacao.getDtfim().getTime()-locacao.getDtinicio().getTime())/1000/60/60/24;
		for(LocacaoDetalhe detalhe : locacao.getLocacaodetalhe()){
			Integer quantidade = detalhe.getQuantidade();
			
			for(DevolucaoLocacao devolucao : locacao.getDevolucaolocacao()){
				
				if(detalhe.getProduto().getId().equals(devolucao.getProduto().getId())){
					Long diasdeutilizacao = (devolucao.getDtdevolucao().getTime()-locacao.getDtinicio().getTime())/1000/60/60/24;
					quantidade = quantidade-devolucao.getQuantidade();
					if(dias < diasdeutilizacao){
						Pagamento p = new Pagamento();
						p.setTipo("E");
						p.setDescricao("Atraso na devolução de equipamento loc. Nº:"+locacao.getId());
						p.setValor(devolucao.getProduto().getPreco(diasdeutilizacao-dias)*devolucao.getQuantidade());
						p.setDtvencimento(new Date());
						locacao.getPagamentos().add(p);
					}
				}	
			}
			if(quantidade > 0){
				Pagamento p = new Pagamento();
				p.setTipo("E");
				p.setDescricao("Equipamento não devolvido");
				p.setValor(detalhe.getProduto().getValor()*quantidade);
				p.setDtvencimento(new Date());
				locacao.getPagamentos().add(p);
			}
		}
		
		}
		return locacao;
	}*/
}
