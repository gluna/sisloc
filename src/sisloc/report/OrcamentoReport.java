package sisloc.report;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import sisloc.modelo.Orcamento;
import br.com.caelum.vraptor.jasperreports.Report;

public class OrcamentoReport implements Report<Orcamento> {

	private List<Orcamento> orcamentos;
	private Map<String, Object> parameters;
	
	public OrcamentoReport(List<Orcamento> orcamentos){
		this.orcamentos = orcamentos;
	}
	
	@Override
	public Report<Orcamento> addParameter(String key, Object value) {
		this.parameters.put(key, value);
		return this;
	}

	@Override
	public Collection<Orcamento> getData() {
		return orcamentos;
	}

	@Override
	public String getFileName() {
		return "report" + System.currentTimeMillis();
	}

	@Override
	public Map<String, Object> getParameters() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTemplate() {
		return "/templates/report.jasper";
	}

}
