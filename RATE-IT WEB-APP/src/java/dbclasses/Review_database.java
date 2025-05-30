package dbclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import rateit.entities.Company;
import rateit.entities.Review;

public class Review_database {

    Connection con;

    public Review_database(Connection con) {
        this.con = con;
    }

    public boolean submitReview(Review review) {
        boolean b = false;

        try {
            String query = "insert into review(POLL_ID,COMPANY_ID,USER_ID,SERVICE,RATE,COMMENT) values(?,?,?,?,?,?)";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, review.getPOLL_ID());
            stmt.setInt(2, review.getCOMPANY_ID());
            stmt.setInt(3, review.getUSER_ID());
            stmt.setString(4, review.getSERVICES());
            stmt.setFloat(5, review.getRATE());
            stmt.setString(6, review.getCOMMENT());

            stmt.executeUpdate();
            b = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }

    public boolean getReviewByUser_id(int user_id,int poll_id) {
        boolean f = false;
        try {
            String query = "select * from review where USER_ID=? and POLL_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, user_id);
            stmt.setInt(2, poll_id);
            ResultSet set = stmt.executeQuery();
            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public int getRatings(int cmp_id , String services){
    int i = 0;
    try{
    String query ="select AVG(RATE) from review where COMPANY_ID=? and SERVICE=?";
    
    PreparedStatement stmt = this.con.prepareStatement(query);
    stmt.setInt(1,cmp_id);
    stmt.setString(2,services);
    
    ResultSet set = stmt.executeQuery();
    
    if(set.next()){
           i = (int)set.getFloat("AVG(RATE)");
    }
    
    }
    catch(Exception e){e.printStackTrace(); }
    
    
    
    return i;
    }
    
    public int getTotalRatings(int cmp_id){
    int i = 0;
    try{
    String query ="select COUNT(RATE) from review where COMPANY_ID=?";
    
    PreparedStatement stmt = this.con.prepareStatement(query);
    stmt.setInt(1,cmp_id);
    
    ResultSet set = stmt.executeQuery();
    
    if(set.next()){
           i = (int)set.getFloat("COUNT(RATE)");
    }
    
    }
    catch(Exception e){e.printStackTrace(); }
    
    
    
    return i;
    }
    
    public boolean submitReview1(Review review) {
        boolean b = false;

        try {
            String query = "insert into review(COMPANY_ID,USER_ID,SERVICE,RATE,COMMENT) values(?,?,?,?,?)";

            PreparedStatement stmt = this.con.prepareStatement(query);
           
            stmt.setInt(1, review.getCOMPANY_ID());
            stmt.setInt(2, review.getUSER_ID());
            stmt.setString(3, review.getSERVICES());
            stmt.setFloat(4, review.getRATE());
            stmt.setString(5, review.getCOMMENT());

            stmt.executeUpdate();
            b = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }
    
    public int getOverallRatings(int cmp_id){
    int i = 0;
    try{
    String query ="select AVG(RATE) from review where COMPANY_ID=?";
    
    PreparedStatement stmt = this.con.prepareStatement(query);
    stmt.setInt(1,cmp_id);
    
    ResultSet set = stmt.executeQuery();
    
    if(set.next()){
           i = (int)set.getFloat("AVG(RATE)");
    }
    
    }
    catch(Exception e){e.printStackTrace(); }
    
    
    
    return i;
    }
    
    
}
