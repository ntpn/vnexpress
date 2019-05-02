package javabean;

import java.util.ArrayList;

import org.apache.solr.client.solrj.beans.Field;

public class New {

	@Field("category")
	private ArrayList<String> category;
	@Field("body")
	private ArrayList<String> body;
	@Field("time_post")
	private String time_post;
	@Field("title")
	private String title;
	@Field("url")
	private String url;
	@Field("tags")
	private ArrayList<String> tags;
	@Field("id")
	private String id;
	@Field("_version_")
	private String _version_;

	public New() {
		super();
	}

	/*
	 * public New(String category, ArrayList<String> body, String time_post, String
	 * title, String url, ArrayList<String> tags, String id, String version ) {
	 * super(); this.category.add(category); this.body = body; this.time_post =
	 * time_post; this.title = title; this.url = url; this.tags = tags; this.id =
	 * id; }
	 */
	public New(ArrayList<String> category, ArrayList<String> body, String time_post, String title, String url,
			ArrayList<String> tags, String id, String _version_) {
		super();
		this.category = category;
		this.body = body;
		this.time_post = time_post;
		this.title = title;
		this.url = url;
		this.tags = tags;
		this.id = id;
		this._version_ = _version_;
	}

	public New(ArrayList<String> category, ArrayList<String> body, String time_post, String title, String url,
			ArrayList<String> tags) {
		super();
		this.category = category;
		this.body = body;
		this.time_post = time_post;
		this.title = title;
		this.url = url;
		this.tags = tags;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public ArrayList<String> getCategory() {
		return category;
	}

	public String getCategoryString() {
		String string = "";
		if (category.size() > 1) {
			for (int i = 0; i < category.size()-1; i++) {
				string = string + category.get(i) + ", ";
			}
			return string + category.get(category.size()-1);
		}else if(category.size() == 0){
			return "";
		}else {
			return category.toString();
		}

	}

	public void setCategory(ArrayList<String> category) {
		this.category = category;
	}

	public ArrayList<String> getBody() {
		return body;
	}

	public String getBodyString() {
		String string = "";
		for (String st : this.body) {
			string = string + st + " ";
		}
		return string;
	}

	public void setBody(ArrayList<String> body) {
		this.body = body;
	}

	public String getTime_post() {
		if (time_post != null) {
			return time_post;
		}
		return "";
	}

	public void setTime_post(String time_post) {
		this.time_post = time_post;
	}

	public String getTitle() {
		if (title != null) {
			return title;
		}
		return "";
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public ArrayList<String> getTags() {
		return tags;
	}

	public String getTagsString() {
		String string = "";
		if (this.tags.size() > 1) {
			for (int i = 0; i < tags.size()-1; i++) {
				string = string + tags.get(i) + ", ";
			}
			return string + tags.get(tags.size()-1);
		}else if(tags.size() == 0){
			return "";}else {
			return tags.toString();
		}
	}

	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String get_version_() {
		return _version_;
	}

	public void set_version_(String _version_) {
		this._version_ = _version_;
	}

}
