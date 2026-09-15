package pe.edu.utp.modelo;

import java.math.BigDecimal;

/** Modelo del carrito: los importes se calculan con precisión decimal. */
public class Producto {
    private final int id;
    private final String nombre;
    private final BigDecimal precio;
    private final int cantidad;
    private final BigDecimal subtotal;

    public Producto(int id, String nombre, String precio, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio = new BigDecimal(precio);
        this.cantidad = cantidad;
        this.subtotal = this.precio.multiply(BigDecimal.valueOf(cantidad));
    }
    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public BigDecimal getPrecio() { return precio; }
    public int getCantidad() { return cantidad; }
    public BigDecimal getSubtotal() { return subtotal; }
}
