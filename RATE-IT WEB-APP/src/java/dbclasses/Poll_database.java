package dbclasses;

import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import rateit.entities.Poll;

public class Poll_database {

    Connection con;

    public Poll_database(Connection con) {
        this.con = con;
    }

    public ArrayList<Poll> getAllPoll() {
        ArrayList<Poll> list = new ArrayList<>();
        try {
            String query = "select * from poll";

            PreparedStatement stmt = this.con.prepareStatement(query);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                Poll p = new Poll();

                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public Poll getPoll(int id) {
        Poll p = null;

        try {
            String query = "select * from poll where POLL_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public boolean removePoll(int Poll_id) {
        boolean f = false;
        try {
            String query = "delete from poll where POLL_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, Poll_id);
            stmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean addPoll(Poll p) {
        boolean b = false;
        try {
            String query = "insert into poll(POLL_ID,START_DATE,COMPANY1,COMPANY2,CATEGORY) values(?,?,?,?,?)";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, p.getPOLL_ID());
            Date date = new Date();
            stmt.setTimestamp(2, new Timestamp(date.getTime()));
            stmt.setInt(3, p.getCOMPANY1());
            stmt.setInt(4, p.getCOMPANY2());
            stmt.setString(5, p.getCATEGORY());
//    stmt.setTimestamp(5, p.getEND_DATE());
            stmt.executeUpdate();
            b = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }

    public ArrayList<Poll> getPollOfCompany(int cmp_id) {
        ArrayList<Poll> list = null;

        try {
            String query = "select * from poll where COMPANY1=? or COMPANY2=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, cmp_id);
            stmt.setInt(2, cmp_id);
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalPoll() {
        int i = 0;

        try {

            String query = "select COUNT(POLL_NO) from poll";

            PreparedStatement stmt = this.con.prepareStatement(query);
            ResultSet set = stmt.executeQuery();

            if (set.next()) {
                i = set.getInt("COUNT(POLL_NO)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
    
    public ArrayList<Poll> getActivePolls() {
        ArrayList<Poll> list = null;

        try {
            String query = "select * from poll where now() BETWEEN START_DATE and END_DATE";

            PreparedStatement stmt = this.con.prepareStatement(query);
            
            
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Poll> getTrendingPolls() {
        ArrayList<Poll> list = null;

        try {
            String query = "SELECT * from rateitdb.poll P INNER JOIN rateitdb.review R ON P.POLL_ID = R.POLL_ID GROUP BY R.POLL_ID order by count(R.POLL_ID) DESC";

            PreparedStatement stmt = this.con.prepareStatement(query);
            
            
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Poll> getExpiredPolls() {
        ArrayList<Poll> list = null;

        try {
            String query = "select * from poll where now() > END_DATE";

            PreparedStatement stmt = this.con.prepareStatement(query);
            
            
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
      
    public ArrayList<Poll> getUpcomingPolls() {
        ArrayList<Poll> list = null;

        try {
            String query = "select * from poll where now() < START_DATE";

            PreparedStatement stmt = this.con.prepareStatement(query);
            
            
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Poll> getRecentPolls() {
        ArrayList<Poll> list = null;

        try {
            String query = "SELECT * FROM POLL where START_DATE > (SELECT date_sub(now(),INTERVAL 7 DAY))";

            PreparedStatement stmt = this.con.prepareStatement(query);
            
            
            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Poll p = new Poll();
                p.setPOLL_NO(set.getInt("POLL_NO"));
                p.setPOLL_ID(set.getInt("POLL_ID"));
                p.setSTART_DATE(set.getTimestamp("START_DATE"));
                p.setCOMPANY2(set.getInt("COMPANY2"));
                p.setCOMPANY1(set.getInt("COMPANY1"));
                p.setCATEGORY(set.getString("CATEGORY"));
                p.setEND_DATE(set.getTimestamp("END_DATE"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
   

    
}
