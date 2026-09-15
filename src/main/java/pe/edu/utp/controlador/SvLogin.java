package pe.edu.utp.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/SvLogin")
public class SvLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String usuario = request.getParameter("txtUsuario");
        String password = request.getParameter("txtPassword");
        // Credenciales fijas exclusivamente para esta práctica académica.
        if ("admin".equals(usuario) && "utp2026".equals(password)) {
            request.getSession();
            request.changeSessionId();
            request.getSession().setAttribute("usuarioLogueado", usuario);
            response.sendRedirect(request.getContextPath() + "/panel.jsp");
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
