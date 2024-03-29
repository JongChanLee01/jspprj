package user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
//       String userAge=request.getParameter("userAge");

		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		
		System.out.println("나이 : "+userAge);
		try {
			response.getWriter().write(register(userName, userAge, userGender, userEmail) + " ");
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}

	public int register(String userName, int userAge, String userGender, String userEmail) throws ClassNotFoundException, SQLException {
       User user =new User();
       user.setUserName(userName);

       user.setUserGender(userGender);
       user.setUserEmail(userEmail);
       user.setUserAge(userAge);
       return new UserDAO().register(user);
    }
}
