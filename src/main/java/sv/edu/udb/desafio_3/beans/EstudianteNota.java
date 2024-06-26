package sv.edu.udb.desafio_3.beans;

public class EstudianteNota {
    private int id;
    private String nombre;
    private String apellidos;
    private String direccion;
    private String telefono;
    private double nota;

    // Constructor vacío
    public EstudianteNota() {
    }

    // Constructor con parámetros (opcional)
    public EstudianteNota(int id, String nombre, String apellidos, String direccion, String telefono, double nota) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.nota = nota;
    }

    // Getters y setters para cada campo
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
}