package dbclasses;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.rowset.serial.SerialBlob;
import rateit.entities.Poll;
import rateit.entities.Report;

public class Report_database {

    Connection con;

    public Report_database(Connection con) {
        this.con = con;
    }

    public Blob getCompanyReport(int COMPANY_ID, int POLL_ID) {
        Blob blob = null;

        try {
            String query = "select * from report where COMPANY_ID=? AND POLL_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, COMPANY_ID);
            stmt.setInt(2, POLL_ID);
            ResultSet set = stmt.executeQuery();
            if (set.next()) {
                blob = set.getBlob("report");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return blob;
    }

    public boolean UploadReport(InputStream is, int COMPANY_ID, int POLL_ID) {
        boolean f = false;
        try {
            String query = "insert into report(POLL_ID,report,COMPANY_ID) value(?,?,?)";
            byte[] b = new byte[is.available()];
            is.read(b);
            Blob blob = new SerialBlob(b);
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, POLL_ID);
            stmt.setBlob(2, blob);
            stmt.setInt(3, COMPANY_ID);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public ArrayList<Report> getReport(int cmp_id) {
        ArrayList<Report> list = null;

        try {
            String query = "select * from report where COMPANY_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, cmp_id);

            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }
            while (set.next()) {
                Report r = new Report();
                r.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                r.setPOLL_ID(set.getInt("POLL_ID"));
                r.setReport(set.getBlob("report"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Report> getAllReport() {
        ArrayList<Report> list = new ArrayList<>();
        try {
            String query = "select * from report";

            PreparedStatement stmt = this.con.prepareStatement(query);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                Report r = new Report();
                r.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


}
