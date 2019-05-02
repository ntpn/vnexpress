package connection;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javabean.New;
import javabean.SetOfNews;

public class SolrConn {
	static String urlString = "http://localhost:8983/solr/vnexpress";
	static HttpSolrClient solr = new HttpSolrClient.Builder(urlString).build();

	public SetOfNews getNewfeed(int pages) throws SolrServerException, IOException {
		SolrQuery query = new SolrQuery();
		query.setQuery("*:*");
		query.setStart(pages*10);
		query.setSort("time_post", SolrQuery.ORDER.desc);
		query.setRows(10);
		QueryResponse response = solr.query(query);
		SolrDocumentList results = response.getResults();
		return new SetOfNews(results.getNumFound(), setToNew(results));
	}
			
	public SetOfNews searchNews(String input, int pages) throws SolrServerException, IOException {
		if (input != "") {
			String[] words = input.split(" ");
			String queryLine = "";
			for (int i = 0; i < words.length - 1; i++) {
				queryLine = queryLine + "\""+ words[i] + "\" AND ";
			}
			queryLine = queryLine + "\""+ words[words.length-1] + "\"";
			SolrQuery query = new SolrQuery();
			query.setQuery(queryLine);
			query.setSort("time_post", SolrQuery.ORDER.desc);
			query.setStart(pages*10);
			query.setRows(10);
			query.set("df","body");
			QueryResponse response = solr.query(query);			
			SolrDocumentList results = response.getResults();
			return new SetOfNews(results.getNumFound(), setToNew(results));
		} else {
			return getNewfeed(pages);
		}
	}
	
	public SetOfNews searchByCategory(String input, int pages) throws SolrServerException, IOException {
			String queryLine = input; //"category:\""+ input + "\"";
			SolrQuery query = new SolrQuery();
			query.setQuery(queryLine);
			query.setSort("time_post", SolrQuery.ORDER.desc);
			query.setStart(pages*10);
			query.setRows(10);
			query.set("df","category");
			QueryResponse response = solr.query(query);			
			SolrDocumentList results = response.getResults();
			return new SetOfNews(results.getNumFound(), setToNew(results));
	}

	public New getNewByID(String id) throws SolrServerException, IOException {
		SolrQuery query = new SolrQuery();
		query.setQuery("*:*");
		SolrDocument result = solr.getById(id);
		ObjectMapper mapper = new ObjectMapper(new JsonFactory());
		New anew = mapper.readValue(result.jsonStr(), New.class);
		return anew;
	}

	public ArrayList<New> setToNew(SolrDocumentList results)
			throws JsonParseException, JsonMappingException, IOException {
		ArrayList<New> list = new ArrayList<New>();
		ObjectMapper mapper = new ObjectMapper(new JsonFactory());
		for (int i = 0; i < results.size(); ++i) {
			New anew = mapper.readValue(results.get(i).jsonStr(), New.class);
			list.add(anew);
		}
		return list;
	}

}
