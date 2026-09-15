package pe.edu.utp.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/SvPromedio")
public class SvPromedio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index_ej1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            BigDecimal n1 = leerNota(request, "nota1");
            BigDecimal n2 = leerNota(request, "nota2");
            BigDecimal n3 = leerNota(request, "nota3");
            BigDecimal a1 = n1.multiply(new BigDecimal("0.20"));
            BigDecimal a2 = n2.multiply(new BigDecimal("0.30"));
            BigDecimal a3 = n3.multiply(new BigDecimal("0.50"));
            BigDecimal promedio = a1.add(a2).add(a3).stripTrailingZeros();
            boolean aprobado = promedio.compareTo(new BigDecimal("12.0")) >= 0;
            request.setAttribute("nota1", n1);
            request.setAttribute("nota2", n2);
            request.setAttribute("nota3", n3);
            request.setAttribute("aporte1", a1);
            request.setAttribute("aporte2", a2);
            request.setAttribute("aporte3", a3);
            request.setAttribute("promedio", promedio.toPlainString());
            request.setAttribute("aprobado", aprobado);
            request.setAttribute("estado", aprobado ? "Aprobado" : "Desaprobado");
            request.getRequestDispatcher("/resultado_ej1.jsp").forward(request, response);
        } catch (IllegalArgumentException ex) {
            request.setAttribute("error", "Ingresa las tres notas entre 0 y 20, con un máximo de dos decimales.");
            request.getRequestDispatcher("/index_ej1.jsp").forward(request, response);
        }
    }

    private BigDecimal leerNota(HttpServletRequest request, String nombre) {
        String valor = request.getParameter(nombre);
        if (valor == null || !valor.trim().matches("[0-9]{1,2}(\\.[0-9]{1,2})?")) {
            throw new IllegalArgumentException("Nota inválida");
        }
        BigDecimal nota = new BigDecimal(valor.trim());
        if (nota.compareTo(BigDecimal.ZERO) < 0 || nota.compareTo(new BigDecimal("20")) > 0) {
            throw new IllegalArgumentException("Nota fuera de rango");
        }
        return nota;
    }
}
