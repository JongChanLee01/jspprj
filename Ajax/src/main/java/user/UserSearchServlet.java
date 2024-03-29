package user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserSearchServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html;charset=UTF-8");
	      String userName=request.getParameter("userName");
	 
	     try {
	      response.getWriter().write(getJSON(userName));
	    } catch (ClassNotFoundException | IOException e) {
	      e.printStackTrace();
	  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getJSON(String userName) throws ClassNotFoundException, SQLException {
	    if(userName==null) userName="";
	    StringBuffer result=new StringBuffer("");
	    result.append("{\"result\":[");
	    UserDAO userDAO=new UserDAO();
	    ArrayList<User> userList=userDAO.search(userName);

	    for(int i=0;i<userList.size();i++) {
	       result.append("[{\"value\":\""+userList.get(i).getUserName()+"\"},");
	       result.append("{\"value\":\""+userList.get(i).getUserAge()+"\"},");
	       result.append("{\"value\":\""+userList.get(i).getUserGender()+"\"},");
	       result.append("{\"value\":\""+userList.get(i).getUserEmail()+"\"}],");
	   }
	      result.append("]}");
	   return result.toString();
	  }
}
