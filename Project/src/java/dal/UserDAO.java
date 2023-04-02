/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Profile;

/**
 *
 * @author Dell
 */
public class UserDAO extends DBContext {

    public List<Account> getUserAll() {

        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [project1].[dbo].[Accounts] a inner join Profiles p\n"
                    + "  on a.accountID = p.accountID";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile p = new Profile(rs.getInt(1), rs.getString(9), 
                        rs.getString(10), rs.getString(11), 
                        rs.getString(12), rs.getString(13), 
                        rs.getDate(14), rs.getString(15), 
                        rs.getInt(16));
                Account a = new Account();
                a.setAccountID(rs.getInt(1));
                a.setUserName(rs.getString(2));
                a.setMoney(rs.getDouble(4));
                a.setEmail(rs.getString(5));
                a.setADMIN(rs.getInt(6));
                a.setRegisterAt(rs.getDate(7));
                a.setInfo(p);
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
