package dao;

public class FeedObj {
	private String id, content, ts;

	public FeedObj(String id, String content, String ts) {
		super();
		this.id = id;
		this.content = content;
		this.ts = ts;
	}

	public String getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

	public String getTs() {
		return ts;
	}

	@Override
	public String toString() {
		return "게시글 : [id=" + id + ", content=" + content + ", ts=" + ts + "]"+"<br/>";
	}
	
}
