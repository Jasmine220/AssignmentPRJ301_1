/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author Administrator
 */
public class AccountDBContext extends DBContext<Account> {

    public Account get(String username, String password) {
        try {
            String sql = "SELECT a.[id]\n"
                    + "      ,a.[username]\n"
                    + "      ,a.[displayname]\n"
                    + "	  ,r.rolid, r.rolname\n"
                    + "	  ,f.fid, f.fname, f.furl\n"
                    + "  FROM [Account] a \n"
                    + "  LEFT JOIN Account_Role ar ON a.id = ar.id\n"
                    + "  LEFT JOIN [Role] r ON ar.rolid = r.rolid\n"
                    + "  LEFT JOIN Role_Feature rf ON r.rolid = rf.rolid\n"
                    + "  LEFT JOIN  Feature f ON rf.fid = f.fid\n"
                    + "  WHERE a.[username] = ? and \n"
                    + "        a.[password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            Role currentRole = new Role();
            currentRole.setId(-1);
            //if rs has at least element
            while(rs.next()){  
                //create account variable only once
                if(account == null){
                    account = new Account();
                    //set username
                    account.setUsername(rs.getString("username"));
                    //set id
                    account.setId(rs.getString("id"));
                    //set displayname
                    account.setDisplayname(rs.getString("displayname"));
                }
                int rolId = rs.getInt("rolid");
                //if account has role
                if(rolId!=0){
                    //if rolId different currentRole Id
                    if(rolId != currentRole.getId()){
                        //use to add all role of each account
                        currentRole = new Role();
                        currentRole.setId(rs.getInt("rolid"));
                        currentRole.setName(rs.getString("rolname"));
                        //add to roles in account
                        account.getRoles().add(currentRole);
                    }
                }
                int featId = rs.getInt("fid");
                //if role has feature
                if(featId != 0){
                    Feature feature = new Feature();
                    feature.setId(rs.getInt("fid"));
                    feature.setName(rs.getString("fname"));
                    feature.setUrl(rs.getString("furl"));
                    //add to role
                    currentRole.getFeatures().add(feature);
                }
                
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
