package dao;

import dto.OrderDetails;
import dto.Orders;
import dto.Product;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import ultis.DBUItis;
import java.util.Date;
/**
 *
 * @author phamv
 */
public class OrderDAO implements Serializable{
    List<Orders> orders=new ArrayList<Orders>();
    public boolean createOrder(Orders order) throws SQLException {
        Connection con= null;
        PreparedStatement ps= null;
        try {
            con= DBUItis.openConnection();
            if(con != null){
                String sql= "Insert Orders Values(?,?,?,?,?)";
                
                ps= con.prepareStatement(sql);
                ps.setString(1, order.getOrderID());
                ps.setString(2, order.getUserName());
                ps.setString(3, order.getAddress());
                ps.setTimestamp(4, new Timestamp(order.getDate().getTime()));
                ps.setDouble(5, order.getTotal());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
            return false;
        }
        finally{
            if(ps != null){
                ps.close();
            }
            if(con != null){
                con.close();
            }
        }
        System.out.println("Add Successful!");
        return true;
    }
    public List<Orders> getAllOrdersCustomer(){
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
       
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * From Orders";
                ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    orders.add(new Orders(rs.getString(1), rs.getString(2),rs.getString(3) ,rs.getDate(4), rs.getDouble(5)));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return orders;
    }
        public boolean createOrderDetail(OrderDetails orderDl){
         Connection con=null;
        PreparedStatement ps=null;
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Insert into OrderDetails values(?,?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setString(1, orderDl.getOrderDetailID());
                ps.setString(2, orderDl.getOrderID());
                ps.setString(3, orderDl.getProductID());
                ps.setDouble(4, orderDl.getPrice());
                ps.setInt(5,orderDl.getQuantity());
                ps.executeUpdate();
            }
        }catch(Exception e){
            
        }
        return false;
    }
        public String getLastOrderByUser(String username) throws Exception{
        String id=null;
         Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            String sql="Select OrderID From Orders Where Date=(Select MAX(Date)  FROM Orders Where Username=?)";
            con=DBUItis.openConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, username);
            rs=ps.executeQuery();
            if(rs.next()){
                id=rs.getString("OrderID");
            }
        }
        finally{
            if(rs!=null){
                rs.close();
            }if(ps!=null){
                ps.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return id;
    }
    
    public static void main(String[] args) {
        OrderDAO dao=new OrderDAO();
        System.out.println(dao.getAllOrdersCustomer());
    }
}
