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
import model.Category;

/**
 *
 * @author Dell
 */
public class CategoryDAO extends DBContext {

    public List<Category> getCategoryByCID(int cid) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [categoryID]\n"
                + "      ,[cid]\n"
                + "      ,[categoryName]\n"
                + "      ,[describe]\n"
                + "  FROM [project1].[dbo].[Categories]\n"
                + "where cid = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt(1));
                c.setCid(rs.getInt(2));
                c.setCategoryName(rs.getString(3));
                c.setDescribe(rs.getString(4));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getCategoryParent() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [categoryID]\n"
                + "      ,[cid]\n"
                + "      ,[categoryName]\n"
                + "      ,[describe]\n"
                + "  FROM [project1].[dbo].[Categories]\n"
                + "  where cid is null ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt(1));
                c.setCid(1);
                c.setCategoryName(rs.getString(3));
                c.setDescribe(rs.getString(4));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [categoryID]\n"
                + "      ,[cid]\n"
                + "      ,[categoryName]\n"
                + "      ,[describe]\n"
                + "  FROM [project1].[dbo].[Categories] \n"
                + "where categoryID not in (1,2,17)";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt(1));
                c.setCid(1);
                c.setCategoryName(rs.getString(3));
                c.setDescribe(rs.getString(4));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getCategoryChild() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [categoryID]\n"
                + "                      ,[cid]\n"
                + "                      ,[categoryName]\n"
                + "                     ,[describe]\n"
                + "                  FROM [project1].[dbo].[Categories] \n"
                + "                where  cid is not null and cid = 1 ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt(1));
                c.setCid(1);
                c.setCategoryName(rs.getString(3));
                c.setDescribe(rs.getString(4));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryByID(int cate) {

        String sql = "SELECT [categoryID]\n"
                + "      ,[cid]\n"
                + "      ,[categoryName]\n"
                + "      ,[describe]\n"
                + "  FROM [project1].[dbo].[Categories]\n"
                + "where categoryID = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, cate);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt(1));
                c.setCid(rs.getInt(2));
                c.setCategoryName(rs.getString(3));
                c.setDescribe(rs.getString(4));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getLastCategoryID() {
        try {
            String sql = "SELECT TOP (1) [categoryID]    \n"
                    + "  FROM [project1].[dbo].[Categories]\n"
                    + "  ORDER BY [categoryID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insert(Category c) {
        try {
            String sql = "INSERT INTO [dbo].[Categories]([categoryName],[describe])\n"
                    + "     VALUES(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setString(2, c.getDescribe());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCategoryByID(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Categories]\n"
                    + "      WHERE categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCategoryByID(String cateName, String describe,int id) {
        try {
            String sql = "UPDATE [dbo].[Categories]\n"
                    + "   SET \n"
                    + "      [categoryName] = ?\n"
                    + "      ,[describe] = ?\n"
                    + " WHERE categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cateName);
            st.setString(2, describe);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
