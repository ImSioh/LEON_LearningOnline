package filters;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(filterName = "Authorization", urlPatterns = {"/*"})
public class AuthorizationFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = HttpServletRequest.class.cast(request);
        HttpServletResponse resp = HttpServletResponse.class.cast(response);
        String path = req.getServletPath();

        Cookie[] cookies = req.getCookies();
        String email = "";
        String password = "";
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase("cookEmail")) {
                    email = cookie.getValue();
                    continue;
                }
                if (cookie.getName().equalsIgnoreCase("cookPass")) {
                    password = cookie.getValue();
                }
            }
        }

        Account account = null;
        if (path.contains("assets") || (path.startsWith("/files") && req.getMethod().equalsIgnoreCase("GET"))) {
            chain.doFilter(request, response);
            return;
        }

        if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
            try {
                account = new AccountDAO().getAccount(email, password);
                if (path.startsWith("/wsendpoint")) {
                    req.getSession(true).setAttribute("account", account);
                } else {
                    req.setAttribute("account", account);
                }
            } catch (Exception e) {
                throw new ServletException(e);
            }
        }

        if (account != null) {
            if ("/index.jsp".equals(path)) {
                if (account.getRole() == 1) {
                    resp.sendRedirect(req.getContextPath() + "/teacher/class");
                } else if (account.getRole() == 2) {
                    resp.sendRedirect(req.getContextPath() + "/student/overview");
                } else if (account.getRole() == 3) {
                    resp.sendRedirect(req.getContextPath() + "/admin/feedback-list");
                }
            } else if ((path.startsWith("/teacher") && account.getRole() != 1)
                    || (path.startsWith("/student") && account.getRole() != 2)
                    || (path.startsWith("/admin") && account.getRole() != 3)) {
                resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You have no permission to access this page");
            } else if (path.startsWith("/signin") || path.startsWith("/signup") || path.startsWith("/forget")) {
                resp.sendRedirect(req.getContextPath());
            }
        } else {
            if (path.startsWith("/teacher") || path.startsWith("/student") || path.startsWith("/admin")) {
                resp.sendRedirect(req.getContextPath() + "/signin");
            }
        }

        if (!resp.isCommitted()) {
            chain.doFilter(request, response);
        }
    }

}
