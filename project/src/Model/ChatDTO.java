package Model;

public class ChatDTO {

	private int chat_number;
	private int chatroom_number;
	private String member_id;
	private String content;
	private String day;
	
	public ChatDTO(int chat_number, int chatroom_number, String member_id, String content, String day) {
		super();
		this.chat_number = chat_number;
		this.chatroom_number = chatroom_number;
		this.member_id = member_id;
		this.content = content;
		this.day = day;
	}

	public int getChat_number() {
		return chat_number;
	}

	public void setChat_number(int chat_number) {
		this.chat_number = chat_number;
	}

	public int getChatroom_number() {
		return chatroom_number;
	}

	public void setChatroom_number(int chatroom_number) {
		this.chatroom_number = chatroom_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
	

}
