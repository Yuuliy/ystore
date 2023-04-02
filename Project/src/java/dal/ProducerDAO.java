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
import model.Producer;

/**
 *
 * @author Dell
 */
public class ProducerDAO extends DBContext {

    public List<Producer> getAll() {
        List<Producer> list = new ArrayList<>();
        String sql = "SELECT [producerID]\n"
                + "      ,[producerName]\n"
                + "      ,[country]\n"
                + "  FROM [project1].[dbo].[Producers]";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Producer p = new Producer();
                p.setProducerID(rs.getInt(1));
                p.setProducerName(rs.getString(2));
                p.setCountry(rs.getString(3));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Producer> getProducerByCID(int[] producerID) {
        List<Producer> list = new ArrayList<>();
        String sql = "SELECT [producerID]\n"
                + "      ,[producerName]\n"
                + "      ,[country]\n"
                + "  FROM [project].[dbo].[Producers]"
                + "where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (producerID != null) {
                sql += "and producerID in(";
                for (int i = 0; i < producerID.length; i++) {
                    if (i == producerID.length - 1) {
                        sql += producerID[i] + " )";
                    } else {
                        sql += producerID[i] + ",";
                    }
                }
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Producer p = new Producer();
                p.setProducerID(rs.getInt(1));
                p.setProducerName(rs.getString(2));
                p.setCountry(rs.getString(3));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Producer getCategoryByID(int p) {

        String sql = "SELECT TOP (1000) [producerID]\n"
                + "      ,[producerName]\n"
                + "      ,[country]\n"
                + "  FROM [project1].[dbo].[Producers]\n"
                + "  where producerID = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, p);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Producer c = new Producer();
                c.setProducerID(rs.getInt(1));
                c.setProducerName(rs.getString(2));
                c.setCountry(rs.getString(3));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Producer p) {
        try {
            String sql = "INSERT INTO [dbo].[Producers]([producerName],[country])\n"
                    + "VALUES(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProducerName());
            st.setString(2, p.getCountry());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Producer getProducerByID(int id) {
        try {
            String sql = "SELECT TOP (1000) [producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[country]\n"
                    + "  FROM [project1].[dbo].[Producers]\n"
                    + "  where producerID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateProducer(String name, String country, int id) {
        try {
            String sql = "UPDATE [dbo].[Producers]\n"
                    + "   SET [producerName] = ?\n"
                    + "      ,[country] = ?\n"
                    + " WHERE producerID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, country);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
