package sv.edu.udb.desafio_3.model;

import sv.edu.udb.desafio_3.beans.Grade;
import sv.edu.udb.desafio_3.beans.Materia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sv.edu.udb.desafio_3.beans.Student;
import utils.DBConnection;

public class SelectModel {
    Connection conn;

    public ArrayList<Materia> showSubject(){
        ArrayList<Materia> lista = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String SQLSELECT = "SELECT * FROM materias";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Materia m = new Materia();
                m.setIdMateria(rs.getInt(1));
                m.setMateria(rs.getString(2));

                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error, no se pudo renderizar");
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public ArrayList<Student> showStudent(){
        ArrayList<Student> list = new ArrayList<>();
        try{
            conn = DBConnection.getConnection();
            String SQLSELECT = "SELECT * FROM estudiantes";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setIdEstudiante(rs.getInt(1));
                s.setApellidos(rs.getString(3));
                s.setNombres(rs.getString(2));

                list.add(s);
            }

        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return list;
    }
}
