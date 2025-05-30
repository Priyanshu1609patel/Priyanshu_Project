package dbclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import rateit.entities.Company_services;

public class Company_services_database {

    Connection con;

    public Company_services_database(Connection con) {
        this.con = con;
    }

    public ArrayList<Company_services> getAllCategories(int COMPANY_ID) {
        ArrayList<Company_services> list = new ArrayList<>();

        try {
            String query = "select * from company_services where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, COMPANY_ID);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                Company_services cs = new Company_services();
                cs.setCATEGORY(set.getString("CATEGORY"));
                cs.setCOMPANY_SERVICES(set.getString("COMPANY_SERVICE"));
                cs.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                list.add(cs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public boolean UpdateCategory(String COMPANY_SERVICE, String CATEGORY,int COMPANY_ID) {
        boolean f = false;
        try {
            String query = "update company set CATEGORY=? where COMPANY_SERVICE=? and COMPANY_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, CATEGORY);
            stmt.setString(2, COMPANY_SERVICE);
            stmt.setInt(3, COMPANY_ID);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }
    
    public boolean addCategory(String COMPANY_SERVICE, String CATEGORY,int COMPANY_ID) {
        boolean f = false;
        try {
            String query = "insert into company_services(COMPANY_SERVICE,CATEGORY,COMPANY_ID) values(?,?,?)";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(2, CATEGORY);
            stmt.setString(1, COMPANY_SERVICE);
            stmt.setInt(3, COMPANY_ID);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public Company_services getCategory(int COMPANY_ID) {
        Company_services cs = new Company_services();;

        try {
            String query = "select * from company_services where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, COMPANY_ID);
            ResultSet set = stmt.executeQuery();
            while(set.next()) {
             
                cs.setCATEGORY(set.getString("CATEGORY"));
                cs.setCOMPANY_SERVICES(set.getString("COMPANY_SERVICE"));
                cs.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cs;
    }
}
   
