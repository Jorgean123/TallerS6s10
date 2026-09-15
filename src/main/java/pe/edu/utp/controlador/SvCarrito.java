package pe.edu.utp.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import pe.edu.utp.modelo.Producto;

@WebServlet("/SvCarrito")
public class SvCarrito extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = List.of(
            new Producto(1, "Laptop Lenovo IdeaPad", "2499.00", 1),
            new Producto(2, "Mouse inalámbrico Logitech", "79.90", 2),
            new Producto(3, "Teclado mecánico Redragon", "189.00", 1),
            new Producto(4, "Monitor LG de 24 pulgadas", "649.00", 2)
        );
        BigDecimal total = BigDecimal.ZERO;
        int unidades = 0;
        for (Producto producto : productos) {
            total = total.add(producto.getSubtotal());
            unidades += producto.getCantidad();
        }
        request.setAttribute("productos", productos);
        request.setAttribute("total", total);
        request.setAttribute("unidades", unidades);
        request.getRequestDispatcher("/carrito.jsp").forward(request, response);
    }
}
