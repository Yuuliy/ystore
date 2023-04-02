/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author Dell
 */
public class ProfileDAO extends DBContext {

    public void changeProfile(Account a) {
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET [email] = ?    \n"
                    + " WHERE accountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getEmail());
            st.setInt(2, a.getAccountID());
            st.executeUpdate();
            String sql1 = "UPDATE [dbo].[Profiles]\n"
                    + "   SET [firstName] = ?\n"
                    + "      ,[lastName] = ?\n"
                    + "      ,[avatar] = ?\n"
                    + "      ,[country] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[birthday] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[gender] = ?\n"
                    + " WHERE [accountID] = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, a.getInfo().getFirstName());
            st1.setString(2, a.getInfo().getLastName());
            st1.setString(3, a.getInfo().getAvatar());
            st1.setString(4, a.getInfo().getCountry());
            st1.setString(5, a.getInfo().getAddress());
            st1.setDate(6, a.getInfo().getBirthDay());
            st1.setString(7, a.getInfo().getPhone());
            st1.setInt(8, a.getInfo().getGender());
            st1.setInt(9, a.getAccountID());
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
