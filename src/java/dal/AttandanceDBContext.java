/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Attandance;

/**
 *
 * @author Administrator
 */
public class AttandanceDBContext extends DBContext<Attandance> {

//    public ArrayList<Attandance> get(int gid, int subid) {
//        String sql = "SELECT a.description, a.present, a.record_time, a.sesid, a.stdid,\n"
//                + "s.stdname, g.gid, g.gname, g.lid, g.sem, g.subid, g.year\n"
//                + "  FROM [Attandance] a\n"
//                + "  INNER JOIN Student s ON a.stdid = s.stdid\n"
//                + "  INNER JOIN Student_Group sg ON sg.stdid = s.stdid\n"
//                + "  INNER JOIN [Group] g ON g.gid = sg.gid\n"
//                + "  WHERE g.gid = ? and g.subid = ?";
//        
//    }

    @Override
    public void insert(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attandance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attandance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
