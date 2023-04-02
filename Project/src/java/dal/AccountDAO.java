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
import model.Product;
import model.Profile;

/**
 *
 * @author Dell
 */
public class AccountDAO extends DBContext {

    public Account checkLogin(String userName, String password) {
        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "                         ,[userName]\n"
                    + "                         ,[password]\n"
                    + "                         ,[amount]\n"
                    + "                         ,[email]\n"
                    + "                         ,[role]\n"
                    + "                         ,[registerAt]\n"
                    + "                         ,[firstName]\n"
                    + "                         ,[lastName]\n"
                    + "                         ,[avatar]\n"
                    + "                         ,[country]\n"
                    + "                         ,[address]\n"
                    + "                         ,[birthday]\n"
                    + "                         ,[phone]\n"
                    + "                         ,[gender]\n"
                    + "                     FROM [dbo].[Accounts] inner join [dbo].[Profiles]\n"
                    + "                     ON [dbo].[Accounts].accountID = [dbo].[Profiles].accountID\n"
                    + "                     WHERE [userName] = ? AND [password] = ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, userName);
            st.setString(2, password);
            //select thi phai co resultset
            //insert, update k can resultset

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profile p = new Profile();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(8));
                p.setLastName(rs.getString(9));
                p.setAvatar(rs.getString(10));
                p.setCountry(rs.getString(11));
                p.setAddress(rs.getString(12));
                p.setBirthDay(rs.getDate(13));
                p.setPhone(rs.getString(14));
                p.setGender(rs.getInt(15));
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkRegister(String userName) {

        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[registerAt]\n"
                    + "      ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [project1].[dbo].[Accounts] inner join [project1].[dbo].[Profiles]\n"
                    + "  ON [project1].[dbo].[Accounts].accountID = [project1].[dbo].[Profiles].accountID\n"
                    + "  WHERE [userName] = ? ";
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, userName);
            //select thi phai co resultset
            //insert, update k can resultset

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profile p = new Profile();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(8));
                p.setLastName(rs.getString(9));
                p.setAvatar(rs.getString(10));
                p.setCountry(rs.getString(11));
                p.setAddress(rs.getString(12));
                p.setBirthDay(rs.getDate(13));
                p.setPhone(rs.getString(14));
                p.setGender(rs.getInt(15));
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkLoginAdmin(String userName, String password) {
        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [Project1].[dbo].[Accounts] inner join [Project1].[dbo].[Profiles]\n"
                    + "  ON [Project1].[dbo].[Accounts].accountID = [Project1].[dbo].[Profiles].accountID\n"
                    + "  WHERE userName = ? AND password = ? AND role not in(0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profile p = new Profile();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(7));
                p.setLastName(rs.getString(8));
                p.setAvatar(rs.getString(9));
                p.setCountry(rs.getString(10));
                p.setAddress(rs.getString(11));
                p.setBirthDay(rs.getDate(12));
                p.setPhone(rs.getString(13));
                p.setGender(rs.getInt(14));

                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6), null, p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(Account a) {
        try {
            String sql = "INSERT INTO [dbo].[Accounts]\n"
                    + "           ([userName]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUserName());
            st.setString(2, a.getPassword());
            st.setString(3, a.getEmail());
            st.setInt(4, 0);
            st.executeUpdate();
            String sql1 = "SELECT TOP 1 a.[accountID]  \n"
                    + "  FROM [project1].[dbo].[Accounts] a\n"
                    + "  Order by a.accountID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                String sql2 = "INSERT INTO [dbo].[Profiles]\n"
                        + "           ([accountID])\n"
                        + "     VALUES\n"
                        + "           (?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, rs.getInt("accountID"));
                st2.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT  a.[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[registerAt]\n"
                    + "	  ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [project1].[dbo].[Accounts] a inner join Profiles p\n"
                    + "  on a.accountID = p.accountID";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile p = new Profile(rs.getInt(1), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getString(14), rs.getInt(15));
                Account a = new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5),
                        rs.getInt(6), rs.getDate(7), p);
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void UpdateAdmin(int role, int id) {
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET [role] = ?\n"
                    + " WHERE accountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changPassword(Account a, String password) {
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET [password] = ?\n"
                    + "      \n"
                    + " WHERE accountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, a.getAccountID());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }



    public int getTotalAccount() {
        try {
            String sql = "SELECT COUNT( [accountID])    \n"
                    + "FROM [project1].[dbo].[Accounts]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

}
