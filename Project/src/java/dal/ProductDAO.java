/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Category;
import model.Producer;
import model.Product;
import model.color;
import model.img;
import model.size;

/**
 *
 * @author Dell
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p1.[productID]\n"
                + "                ,c.[categoryID]\n"
                + "                ,c.cid\n"
                + "                ,p1.[producerID]\n"
                + "                ,c.[categoryName]\n"
                + "                ,c.[describe]\n"
                + "                 ,pr.producerName\n"
                + "                 ,pr.country\n"
                + "                ,p1.[productName]\n"
                + "                ,p1.[price]\n"
                + "                ,p1.[quantity]\n"
                + "                ,p1.[insurance] \n"
                + "                ,p2.[image1]\n"
                + "               ,p2.image2\n"
                + "                ,p2.image3\n"
                + "                ,p2.image4\n"
                + "                ,p3.color1\n"
                + "               ,p3.color2\n"
                + "                ,p3.color3\n"
                + "                ,p3.color4\n"
                + "                ,p3.color5\n"
                + "                ,p4.size1\n"
                + "                ,p4.size2\n"
                + "                ,p4.size3\n"
                + "                ,p4.size4\n"
                + "                FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "                on p1.productID = p2.productID inner join Categories c\n"
                + "                on p1.categoryID = c.categoryID inner join Productcolor p3\n"
                + "                on p1.productID = p3.productID inner join Productsize p4\n"
                + "                on p1.productID = p4.productID inner join Producers pr\n"
                + "				on p1.producerID = pr.producerID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
                color c = new color(rs.getInt(1), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21));
                size s = new size(rs.getInt(1), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Producer pr = new Producer(rs.getInt(4), rs.getString(7), rs.getString(8));
                Category cate = new Category(rs.getInt(2), rs.getInt(3), rs.getString(5), rs.getString(6));
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setCategories(cate);
                p.setProducer(pr);
                p.setProductName(rs.getString(9));
                p.setPrice(rs.getDouble(10));
                p.setQuantity(rs.getInt(11));
                p.setInsurance(rs.getInt(12));
                p.setImages(i);
                p.setColor(c);
                p.setSize(s);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 8 p1.[productID]\n"
                + "      ,[categoryID]\n"
                + "      ,[producerID]\n"
                + "      ,[productName]\n"
                + "      ,[price]\n"
                + "      ,[quantity]\n"
                + "      ,[insurance] \n"
                + "	  ,p2.[image1]	  \n"
                + "	  ,p2.[image2]	  \n"
                + "	  ,p2.[image3]	  \n"
                + "	  ,p2.[image4]	  \n"
                + "  FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "  on p1.productID = p2.productID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
                Product p = new Product();

                p.setProductID(rs.getInt(1));
                p.setCategoryID(rs.getInt(2));
                p.setProducerID(rs.getInt(3));
                p.setProductName(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setQuantity(rs.getInt(6));
                p.setInsurance(rs.getInt(7));
                p.setImages(i);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Product> getProductsComing() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 8 p1.[productID]\n"
                + "      ,c.[categoryID]\n"
                + "      ,[producerID]\n"
                + "      ,[productName]\n"
                + "      ,[price]\n"
                + "      ,[quantity]\n"
                + "      ,[insurance] \n"
                + "	  ,p2.[image1]	  \n"
                + "	  ,p2.[image2]	  \n"
                + "	  ,p2.[image3]	  \n"
                + "	  ,p2.[image4]	  \n"
                + "  FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "  on p1.productID = p2.productID inner join Categories c\n"
                + "  on p1.categoryID = c.categoryID\n"
                + "  where cid =2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
                Product p = new Product();

                p.setProductID(rs.getInt(1));
                p.setCategoryID(rs.getInt(2));
                p.setProducerID(rs.getInt(3));
                p.setProductName(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setQuantity(rs.getInt(6));
                p.setInsurance(rs.getInt(7));
                p.setImages(i);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductbyCategoryID(String categoryID, String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p1.[productID]\n"
                + "      ,c.[categoryID]\n"
                + "	  ,cid\n"
                + "      ,[producerID]\n"
                + "      ,[productName]\n"
                + "      ,[price]\n"
                + "      ,[quantity]\n"
                + "      ,[insurance] \n"
                + "	  ,p2.[image1]	  \n"
                + "	  ,p2.[image2]	  \n"
                + "	  ,p2.[image3]	  \n"
                + "	  ,p2.[image4]	  \n"
                + "  FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "  on p1.productID = p2.productID inner join Categories c\n"
                + "  on p1.categoryID = c.categoryID\n"
                + "  where cid = ? and c.categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(2, categoryID);
            st.setString(3, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
                Product p = new Product();

                p.setProductID(rs.getInt(1));
                p.setCategoryID(rs.getInt(2));
                p.setProducerID(rs.getInt(3));
                p.setProductName(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setQuantity(rs.getInt(6));
                p.setInsurance(rs.getInt(7));
                p.setImages(i);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public Product getProductByProductID(int productID) {
        String sql = "SELECT p1.[productID]\n"
                + "                ,c.[categoryID]\n"
                + "                ,c.cid\n"
                + "                ,p1.[producerID]\n"
                + "                ,c.[categoryName]\n"
                + "                ,c.[describe]\n"
                + "                 ,pr.producerName\n"
                + "                 ,pr.country\n"
                + "                ,p1.[productName]\n"
                + "                ,p1.[price]\n"
                + "                ,p1.[quantity]\n"
                + "                ,p1.[insurance] \n"
                + "                ,p2.[image1]\n"
                + "               ,p2.image2\n"
                + "                ,p2.image3\n"
                + "                ,p2.image4\n"
                + "                ,p3.color1\n"
                + "               ,p3.color2\n"
                + "                ,p3.color3\n"
                + "                ,p3.color4\n"
                + "                ,p3.color5\n"
                + "                ,p4.size1\n"
                + "                ,p4.size2\n"
                + "                ,p4.size3\n"
                + "                ,p4.size4\n"
                + "                FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "                on p1.productID = p2.productID inner join Categories c\n"
                + "                on p1.categoryID = c.categoryID inner join Productcolor p3\n"
                + "                on p1.productID = p3.productID inner join Productsize p4\n"
                + "                on p1.productID = p4.productID inner join Producers pr\n"
                + "				on p1.producerID = pr.producerID\n"
                + "                 where p1.[productID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
                color c = new color(rs.getInt(1), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21));
                size s = new size(rs.getInt(1), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Producer pr = new Producer(rs.getInt(4), rs.getString(7), rs.getString(8));
                Category cate = new Category(rs.getInt(2), rs.getInt(3), rs.getString(5), rs.getString(6));
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setCategories(cate);
                p.setProducer(pr);
                p.setProductName(rs.getString(9));
                p.setPrice(rs.getDouble(10));
                p.setQuantity(rs.getInt(11));
                p.setInsurance(rs.getInt(12));
                p.setImages(i);
                p.setColor(c);
                p.setSize(s);
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getProductByCategoryIDPromax(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p1.[productID]\n"
                + "      ,c.[categoryID]\n"
                + "	 ,c.cid\n"
                + "      ,p1.[producerID]\n"
                + "      ,p1.[productName]\n"
                + "      ,p1.[price]\n"
                + "      ,p1.[quantity]\n"
                + "      ,p1.[insurance] \n"
                + "	  ,p2.[image1]\n"
                + "	  ,p2.image2\n"
                + "	  ,p2.image3\n"
                + "	  ,p2.image4\n"
                + "	  ,p3.color1\n"
                + "	  ,p3.color2\n"
                + "	  ,p3.color3\n"
                + "	  ,p3.color4\n"
                + "	  ,p3.color5\n"
                + "	  ,p4.size1\n"
                + "	  ,p4.size2\n"
                + "	  ,p4.size3\n"
                + "	  ,p4.size4\n"
                + "       ,c.categoryName\n"
                + "  FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "  on p1.productID = p2.productID inner join Categories c\n"
                + "  on p1.categoryID = c.categoryID inner join Productcolor p3\n"
                + "  on p1.productID = p3.productID inner join Productsize p4\n"
                + "  on p1.productID = p4.productID"
                + "  where 1=1";
        try {
            if (cid != null) {
                sql += " AND c.categoryID IN ( ";
                for (int i = 0; i < cid.length; i++) {
                    if (i == cid.length - 1) {
                        sql += cid[i] + " )";
                    } else {
                        sql += cid[i] + ", ";
                    }
                }
            }

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(13));
                color c = new color(rs.getInt(1), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17));
                size s = new size(rs.getInt(1), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21));
                Category cate = new Category(rs.getInt(2), 0, rs.getString(22), "");
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setCategoryID(rs.getInt(2));
                p.setProducerID(rs.getInt(4));
                p.setProductName(rs.getString(5));
                p.setPrice(rs.getDouble(6));
                p.setQuantity(rs.getInt(7));
                p.setInsurance(rs.getInt(8));
                p.setImages(i);
                p.setColor(c);
                p.setSize(s);
                p.setCategories(cate);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public int getLastProductID() {
        try {
            String sql = "SELECT TOP (1) [productID]\n"
                    + "  FROM [project1].[dbo].[Products]\n"
                    + "  order by productID desc";
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

    public void addProduct(Product p) {
        try {
            String sql = "INSERT INTO [dbo].[Products]\n"
                    + "           ([categoryID],[producerID],[productName],[price],[quantity],[insurance])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getCategories().getCategoryID());
            st.setInt(2, p.getProducer().getProducerID());
            st.setString(3, p.getProductName());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getQuantity());
            st.setInt(6, p.getInsurance());
            st.executeUpdate();

            String sql1 = "INSERT INTO [dbo].[Productcolor]\n"
                    + "           ([productID],[color1],[color2],[color3],[color4],[color5])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, getLastProductID());
            st1.setString(2, p.getColor().getColor1());
            st1.setString(3, p.getColor().getColor2());
            st1.setString(4, p.getColor().getColor3());
            st1.setString(5, p.getColor().getColor4());
            st1.setString(6, p.getColor().getColor5());
            st1.executeUpdate();

            String sql2 = "INSERT INTO [dbo].[Productimage]\n"
                    + "			([productID],[image1],[image2],[image3],[image4])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, getLastProductID());
            st2.setString(2, p.getImages().getImage1());
            st2.setString(3, p.getImages().getImage2());
            st2.setString(4, p.getImages().getImage3());
            st2.setString(5, p.getImages().getImage4());
            st2.executeUpdate();

            String sql3 = "INSERT INTO [dbo].[Productsize]\n"
                    + "           ([productID],[size1],[size2],[size3],[size4])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, getLastProductID());
            st3.setString(2, p.getSize().getSize1());
            st3.setString(3, p.getSize().getSize2());
            st3.setString(4, p.getSize().getSize3());
            st3.setString(5, p.getSize().getSize4());
            st3.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Product> getSearchProducts(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p1.[productID]\n"
                + "                ,c.[categoryID]\n"
                + "                ,c.cid\n"
                + "                ,p1.[producerID]\n"
                + "                ,c.[categoryName]\n"
                + "                ,c.[describe]\n"
                + "                 ,pr.producerName\n"
                + "                 ,pr.country\n"
                + "                ,p1.[productName]\n"
                + "                ,p1.[price]\n"
                + "                ,p1.[quantity]\n"
                + "                ,p1.[insurance] \n"
                + "                ,p2.[image1]\n"
                + "               ,p2.image2\n"
                + "                ,p2.image3\n"
                + "                ,p2.image4\n"
                + "                ,p3.color1\n"
                + "               ,p3.color2\n"
                + "                ,p3.color3\n"
                + "                ,p3.color4\n"
                + "                ,p3.color5\n"
                + "                ,p4.size1\n"
                + "                ,p4.size2\n"
                + "                ,p4.size3\n"
                + "                ,p4.size4\n"
                + "                FROM [project1].[dbo].[Products] p1 inner join Productimage p2 \n"
                + "                on p1.productID = p2.productID inner join Categories c\n"
                + "                on p1.categoryID = c.categoryID inner join Productcolor p3\n"
                + "                on p1.productID = p3.productID inner join Productsize p4\n"
                + "                on p1.productID = p4.productID inner join Producers pr\n"
                + "                on p1.producerID = pr.producerID"
                + "                where p1.[productName] like ? or c.[categoryName] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img i = new img(rs.getInt(1), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
                color c = new color(rs.getInt(1), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21));
                size s = new size(rs.getInt(1), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Producer pr = new Producer(rs.getInt(4), rs.getString(7), rs.getString(8));
                Category cate = new Category(rs.getInt(2), rs.getInt(3), rs.getString(5), rs.getString(6));
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setCategories(cate);
                p.setProducer(pr);
                p.setProductName(rs.getString(9));
                p.setPrice(rs.getDouble(10));
                p.setQuantity(rs.getInt(11));
                p.setInsurance(rs.getInt(12));
                p.setImages(i);
                p.setColor(c);
                p.setSize(s);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public int getProductTotal() {
        try {
            String sql = "SELECT Count([productID])       \n"
                    + "  FROM [project1].[dbo].[Products]";
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

    public HashMap<Integer, Integer> getDataChart(int CategoryID) {
        try {
            HashMap<Integer, Integer> map = new HashMap<>();
            for (int i = 1; i <= 12; i++) {
                String sql = "SELECT SUM( o.total)  as 'Saled'\n"
                        + "\n"
                        + "FROM Products p	inner join OrderDetail ol\n"
                        + "on p.productID = ol.productID inner join Orders o\n"
                        + "on o.orderID = ol.orderID inner join Categories c\n"
                        + "on c.categoryID = p.categoryID\n"
                        + " group by p.categoryID, o.CreateAt, c.categoryName\n"
                        + "HAVING month(o.CreateAt) in (?) and p.categoryID = ?";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setInt(2, CategoryID);
                ResultSet rs = st.executeQuery();
                switch (i) {
                    case 1:
                        map.put(1, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 2:
                        map.put(2, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 3:
                        map.put(3, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 4:
                        map.put(4, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 5:
                        map.put(5, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 6:
                        map.put(6, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 7:
                        map.put(7, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 8:
                        map.put(8, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 9:
                        map.put(9, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 10:
                        map.put(10, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 11:
                        map.put(11, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 12:
                        map.put(12, (rs.next() ? rs.getInt(1) : 0));
                        break;
                }
            }

            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void deleteProductById(int id) {
        try {
            String sql1 = "DELETE FROM [dbo].[Productcolor]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();

            String sql2 = "DELETE FROM [dbo].[Productimage]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();

            String sql3 = "DELETE FROM [dbo].[Productsize]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, id);
            st3.executeUpdate();

            String sql = "DELETE FROM [dbo].[Products]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product p) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [categoryID] = ?\n"
                    + "      ,[producerID] = ?\n"
                    + "      ,[productName] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[insurance] = ?\n"
                    + " WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getCategoryID());
            st.setInt(2, p.getProducerID());
            st.setString(3, p.getProductName());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getQuantity());
            st.setInt(6, p.getInsurance());
            st.setInt(7, p.getProductID());
            st.executeUpdate();

            String sql2 = "UPDATE [dbo].[Productimage]\n"
                    + "   SET \n"
                    + "      [image1] = ?\n"
                    + "\n"
                    + " WHERE productID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, p.getImages().getImage1());
            st2.setInt(2, p.getProductID());
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getListProductByCategoryID(int id) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP(6) p.[productID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,[productName]\n"
                    + "      ,[price]\n"
                    + "      ,[quantity]\n"
                    + "      ,[insurance]\n"
                    + "	  ,p1.image1\n"
                    + "	  ,c.categoryName\n"
                    + "  FROM [project1].[dbo].[Products] p inner join Productimage p1\n"
                    + "  on p.productID = p1.productID inner join Categories c\n"
                    + "  on p.categoryID = c.categoryID inner join Producers pr\n"
                    + "  on p.producerID = pr.producerID\n"
                    + "  where p.categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                size s = new size(rs.getInt(1), "", "", "", "");
                img i = new img(rs.getInt(1), rs.getString(8), "", "", "");
                Category c = new Category(rs.getInt(2), 0, rs.getString(9), "");
                Producer pr = new Producer(rs.getInt(3), "", "");
                color cl = new color(rs.getInt(1), "", "", "", "", "");
                Product p = new Product(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), cl, rs.getInt(7), s, i, c, pr);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
