package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

@WebFilter("/CharacterEncodingFilter")
public class CharacterEncodingFilter extends HttpFilter implements Filter {

    public CharacterEncodingFilter() {
        super();
    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		chain.doFilter(request, response);
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("프로젝트를 시작합니다..");
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
