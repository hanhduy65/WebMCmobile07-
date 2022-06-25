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
import model.Admin;
import model.Product;

/**
 *
 * @author hanh
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getInt("IDSanPham"));
                c.setName(rs.getString("Ten"));
                c.setTitle(rs.getString("tittle"));
                c.setPrice(rs.getDouble("Gia"));
                c.setQuantity(rs.getInt("SoLuong"));
                c.setUnit(rs.getString("DonViTinh"));
                c.setImage(rs.getString("Anh"));
                c.setReleaseDate(rs.getDate("NgayMoBan"));
                c.setDesc(rs.getString("MieuTa"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByTitle(String title) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getInt("IDSanPham"));
                c.setName(rs.getString("Ten"));
                c.setTitle(rs.getString("tittle"));
                c.setPrice(rs.getDouble("Gia"));
                c.setQuantity(rs.getInt("SoLuong"));
                c.setUnit(rs.getString("DonViTinh"));
                c.setImage(rs.getString("Anh"));
                c.setReleaseDate(rs.getDate("NgayMoBan"));
                c.setDesc(rs.getString("MieuTa"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getTitle() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT tittle FROM SanPham group by IDLoaiSP, tittle";
        String title = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                title = rs.getString("tittle");
                list.add(title);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham where IDLoaiSP = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getInt("IDSanPham"));
                c.setName(rs.getString("Ten"));
                c.setTitle(rs.getString("tittle"));
                c.setPrice(rs.getDouble("Gia"));
                c.setQuantity(rs.getInt("SoLuong"));
                c.setUnit(rs.getString("DonViTinh"));
                c.setImage(rs.getString("Anh"));
                c.setReleaseDate(rs.getDate("NgayMoBan"));
                c.setDesc(rs.getString("MieuTa"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(String id) {

        String sql = "SELECT * FROM SanPham where IDSanPham = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getInt("IDSanPham"));
                c.setName(rs.getString("Ten"));
                c.setTitle(rs.getString("tittle"));
                c.setPrice(rs.getDouble("Gia"));
                c.setQuantity(rs.getInt("SoLuong"));
                c.setUnit(rs.getString("DonViTinh"));
                c.setImage(rs.getString("Anh"));
                c.setReleaseDate(rs.getDate("NgayMoBan"));
                c.setDesc(rs.getString("MieuTa"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from SanPham\n"
                + "where [Ten] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getInt("IDSanPham"));
                c.setName(rs.getString("Ten"));
                c.setTitle(rs.getString("tittle"));
                c.setPrice(rs.getDouble("Gia"));
                c.setQuantity(rs.getInt("SoLuong"));
                c.setUnit(rs.getString("DonViTinh"));
                c.setImage(rs.getString("Anh"));
                c.setReleaseDate(rs.getDate("NgayMoBan"));
                c.setDesc(rs.getString("MieuTa"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Admin check(String username, String password) {
        String sql = "SELECT [username]\n"
                + "      ,[password]\n"
               
                + "  FROM [dbo].[Admin]\n"
                + "  where [username] = ? and  [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString("username"), rs.getString("password"));
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        System.out.println(d.check("hanh", "123@"));
    }
}
