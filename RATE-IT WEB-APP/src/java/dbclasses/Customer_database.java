package dbclasses;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.rowset.serial.SerialBlob;
import rateit.entities.Customer;

public class Customer_database {

    Connection con;

    public Customer_database(Connection con) {
        this.con = con;
    }

    public boolean saveCustomer(Customer customer) {
        boolean f = false;

        try {
            String query = "insert into customer_info(USER_NAME,EMAIL,PASSWORD) values(?,?,?)";

            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setString(1, customer.getUSER_NAME());
            stmt.setString(2, customer.getEMAIL());
            stmt.setString(3, customer.getPASSWORD());

            stmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Customer getCustomerByEmail(String email, String password) {
        Customer customer = null;
        try {
            String query = "select * from customer_info where EMAIL=? and PASSWORD =?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                customer = new Customer();

                customer.setUSER_ID(set.getInt("USER_ID"));
                customer.setUSER_NAME(set.getString("USER_NAME"));
                customer.setEMAIL(set.getString("EMAIL"));
                customer.setPASSWORD(set.getString("PASSWORD"));
                customer.setLOGIN_STATUS(set.getBoolean("LOGIN_STATUS"));
                customer.setATTENDED_POLL(set.getInt("ATTENDED_POLL"));
                customer.setREMAINDER(set.getInt("REMAINDER"));
                customer.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;

    }

    public Customer getCustomerByEmail(String email) {
        Customer customer = null;
        try {
            String query = "select * from customer_info where EMAIL=?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setString(1, email);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                customer = new Customer();

                customer.setUSER_ID(set.getInt("USER_ID"));
                customer.setUSER_NAME(set.getString("USER_NAME"));
                customer.setEMAIL(set.getString("EMAIL"));
                customer.setPASSWORD(set.getString("PASSWORD"));
                customer.setLOGIN_STATUS(set.getBoolean("LOGIN_STATUS"));
                customer.setATTENDED_POLL(set.getInt("ATTENDED_POLL"));
                customer.setREMAINDER(set.getInt("REMAINDER"));
                customer.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;

    }

    public boolean UpdatePassword(String email, String password) {
        boolean f = false;

        try {
            PreparedStatement stmt = this.con.prepareStatement("update customer_info set PASSWORD=? where EMAIL=?");

            stmt.setString(1, password);
            stmt.setString(2, email);

            if (stmt.executeUpdate() == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean UpdateProfile(String USER_NAME, int USER_ID) {
        boolean f = false;
        try {
            String query = "update customer_info set USER_NAME=? where USER_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, USER_NAME);
            stmt.setInt(2, USER_ID);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public boolean UploadPhoto(InputStream is, int USER_ID) {
        boolean f = false;
        try {
            String query = "Update customer_info set PROFILE_IMG=? where USER_ID=?";
            byte[] b = new byte[is.available()];
            is.read(b);
            Blob blob = new SerialBlob(b);
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setBlob(1, blob);
            stmt.setInt(2, USER_ID);
            stmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Blob getImage(int USER_ID) {
        Blob blob = null;

        try {
            String query = "select PROFILE_IMG from customer_info where USER_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, USER_ID);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                blob = set.getBlob("PROFILE_IMG");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return blob;
    }
    
    public boolean updateAttendedPoll(int cus_id,int num){
      boolean f = false;
        try {
            String query = "update customer_info set ATTENDED_POLL=? where USER_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, num);
            stmt.setInt(2, cus_id);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    
    }
    
    public int getTotalUser() {
        int i = 0;

        try {

            String query = "select COUNT(USER_ID) from customer_info";

            PreparedStatement stmt = this.con.prepareStatement(query);
            ResultSet set = stmt.executeQuery();

            if (set.next()) {
                i = set.getInt("COUNT(USER_ID)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
