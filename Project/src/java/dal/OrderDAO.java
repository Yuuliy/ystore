/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Account;
import model.Cart;
import model.Category;
import model.Order;
import model.OrderDetail;
import model.Producer;
import model.Product;
import model.Profile;

/**
 *
 * @author Dell
 */
public class OrderDAO extends DBContext {

    public List<Order> getOrderList() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [project1].[dbo].[Orders] o inner join Accounts a\n"
                    + "  on o.accountID = a.accountID inner join Profiles p\n"
                    + "  on a.accountID = p.accountID"
                    + "  ORDER BY [createAt] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile p = new Profile(rs.getInt(2), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getDate(20), rs.getString(21), rs.getInt(22));
                Account a = new Account(rs.getInt(2), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getInt(12), rs.getDate(13), p);
                Order o = new Order(rs.getInt(1), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6), a);
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Order> getOrderListBySearch(Date f, Date t, String s) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [project1].[dbo].[Orders] o inner join Accounts a\n"
                    + "  on o.accountID = a.accountID inner join Profiles p\n"
                    + "  on a.accountID = p.accountID\n"
                    + "  where createAt between ? and ? and [status] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setDate(1, f);
            st.setDate(2, t);
            st.setString(3, s);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile p = new Profile(rs.getInt(2), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getDate(20), rs.getString(21), rs.getInt(22));
                Account a = new Account(rs.getInt(2), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getInt(12), rs.getDate(13), p);
                Order o = new Order(rs.getInt(1), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6), a);
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Order getOrderByID(int id) {
        try {
            String sql = "SELECT *\n"
                    + "                      FROM [project1].[dbo].[Orders] o inner join Accounts a\n"
                    + "                      on o.accountID = a.accountID inner join Profiles p\n"
                    + "                      on a.accountID = p.accountID\n"
                    + "					  where orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Profile p = new Profile(rs.getInt(2), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getDate(20), rs.getString(21), rs.getInt(22));
                Account a = new Account(rs.getInt(2), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getInt(12), rs.getDate(13), p);
                Order o = new Order(rs.getInt(1), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6), a);
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalOrder(int month, int year) {
        try {
            String sql = "SELECT sum([total])\n"
                    + "  FROM [project1].[dbo].[Orders]\n"
                    + "  where MONTH([createAt]) = ? and Year([createAt]) = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public String getPriceFormat(double price) {
        Locale vn = new Locale("vi", "vn");
        NumberFormat f = NumberFormat.getInstance(vn);

        return f.format(price);
    }

    public List<Order> getNewOrder() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT top(5) *\n"
                    + "  FROM [project1].[dbo].[Orders] o inner join Accounts a\n"
                    + "  on o.accountID = a.accountID inner join Profiles p\n"
                    + "  on a.accountID = p.accountID"
                    + " ORDER BY [createAt] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile p = new Profile(rs.getInt(2), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getDate(20), rs.getString(21), rs.getInt(22));
                Account a = new Account(rs.getInt(2), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getInt(12), rs.getDate(13), p);
                Order o = new Order(rs.getInt(1), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6), a);
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changeOrderStatus(int id, String status) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [status] = ?\n"
                    + "\n"
                    + " WHERE orderID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<OrderDetail> getOrderDetail(int id) {
        List<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT [orderID]\n"
                    + "      ,o.[productID]\n"
                    + "      ,o.[quantity]\n"
                    + "      ,o.[price]\n"
                    + "      ,[size]\n"
                    + "      ,[color]\n"
                    + "	  ,p.productName\n"
                    + "  FROM [project1].[dbo].[OrderDetail] o inner join [project1].[dbo].[Products] p\n"
                    + "  on o.productID = p.productID \n"
                    + "  where orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                pr.setProductID(rs.getInt(2));
                pr.setProductName(rs.getString(7));
                OrderDetail o = new OrderDetail(rs.getInt(3), rs.getString(6), rs.getString(5), pr);
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
