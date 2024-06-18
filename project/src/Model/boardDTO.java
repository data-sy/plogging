package Model;

public class boardDTO {
   
   private int boardNum;
   private String memberId;
   private String boardDate;
   private String boardContent;
   private String boardTitle;
   private String boardImage;
   
   
   
   public boardDTO(String boardContent, String boardTitle, String boardImage) {
   super();
   this.boardContent = boardContent;
   this.boardTitle = boardTitle;
   this.boardImage = boardImage;
}


public boardDTO(int boardNum, String memberId, String boardDate, String boardContent, String boardTitle,
         String boardImage) {
      super();
      this.boardNum = boardNum;
      this.memberId = memberId;
      this.boardDate = boardDate;
      this.boardContent = boardContent;
      this.boardTitle = boardTitle;
      this.boardImage = boardImage;
   }
   
   
   public boardDTO(String memberId, String boardContent, String boardTitle, String boardImage) {
      super();
      this.memberId = memberId;
      this.boardContent = boardContent;
      this.boardTitle = boardTitle;
      this.boardImage = boardImage;
   }


   public int getBoardNum() {
      return boardNum;
   }
   public void setBoardNum(int boardNum) {
      this.boardNum = boardNum;
   }
   public String getMemberId() {
      return memberId;
   }
   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }
   public String getBoardDate() {
      return boardDate;
   }
   public void setBoardDate(String boardDate) {
      this.boardDate = boardDate;
   }
   public String getBoardContent() {
      return boardContent;
   }
   public void setBoardContent(String boardContent) {
      this.boardContent = boardContent;
   }
   public String getBoardTitle() {
      return boardTitle;
   }
   public void setBoardTitle(String boardTitle) {
      this.boardTitle = boardTitle;
   }
   public String getBoardImage() {
      return boardImage;
   }
   public void setBoardImage(String boardImage) {
      this.boardImage = boardImage;
   }
   
   
   
   

   
   
   
   
   
}