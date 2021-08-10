package dao;

import dto.OrderDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ultis.DBUItis;
public class OrderDetailDao {
    public List<OrderDetails> getAllOrderDetails(){
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
       List<OrderDetails> list=new ArrayList<>();
        try{
            con=DBUItis.openConnection();
            if(con!=null){
                String sql="Select * From OrderDetail";
                ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                OrderDetails orderdetail=new OrderDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5));
                list.add(orderdetail);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
