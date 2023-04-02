/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author phanh
 */
public class CartDAO extends DBContext {

    public void insert(Account a, Cart cart, String d) {

        try {

            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([accountID]\n"
                    + "           ,[total]\n"
                    + "           ,[createAt]\n"
                    + "           ,[status]\n"
                    + "           ,[deliveryAddress])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,'pending',?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getAccountID());
            st.setDouble(2, cart.getTotalMoney());
            st.setString(4, d);
            st.setDate(3, getCurrentDate());
            st.executeUpdate();

            String sql1 = "SELECT top 1 orderID from [dbo].[Orders] order by orderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int orderID = rs.getInt(1);
                for (Item item : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([orderID]\n"
                            + "           ,[productID]\n"
                            + "           ,[quantity]\n"
                            + "           ,[color]\n"
                            + "           ,[size]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderID);
                    st2.setInt(2, item.getProduct().getProductID());
                    st2.setInt(3, item.getQuantity());
                    st2.setString(4, item.getColor());
                    st2.setString(5, item.getSize());
                    st2.setDouble(6, item.getProduct().getPrice());
                    st2.executeUpdate();
                    String sql3 = "UPDATE [dbo].[Products]\n"
                            + "   SET [quantity] = quantity - ?\n"
                            + "\n"
                            + " WHERE productID = ?";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, item.getQuantity());
                    st3.setInt(2, item.getProduct().getProductID());
                    st3.executeUpdate();

                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }
}
