package book;


public class BookService {
    static final String 제목_필수 = "제목을 입력하세요";
    static final String 저자_필수 = "저자를 입력하세요";
    static final String 카테고리_필수 = "카테고리를 입력하세요";
    static final String 가격_필수 = "가격을 입력하세요";
    static final String 출판사_필수 = "출판사를 입력하세요";
    static final String 제목_중복 = "제목이 중복됩니다";
    static final String 작업_실패 = "작업 도중 오류가 발생했습니다";


    public static String validate(Book book) throws Exception {

        if (StringUtil.isEmptyOrBlank(book.getTitle()))
            return 제목_필수;
        
        if (StringUtil.isEmptyOrBlank(book.getAuthor()))
            return 저자_필수;
        
        if (book.getCategoryId() == 0)
            return 카테고리_필수;
        
        if (book.getPrice() <= 0)
            return 가격_필수;
        
        if (StringUtil.isEmptyOrBlank(book.getPublisher()))
            return 출판사_필수;
        
        Book book1 = BookDAO.findByName(book.getTitle());
        if (book1 != null && book1.getId() != book.getId())
            return 제목_중복;
        return null;
    }
 
    public static String insert(Book book) {
        try {
            String errorMessage = validate(book);
            if (errorMessage != null) return errorMessage;
            BookDAO.insert(book);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }
 
    public static String update(Book book) {
        try {
            String errorMessage = validate(book);
            if (errorMessage != null) return errorMessage;
            BookDAO.update(book);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }

    public static String delete(int id) {
        try {
            BookDAO.delete(id);
            return null;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return 작업_실패;
        }
    }
}