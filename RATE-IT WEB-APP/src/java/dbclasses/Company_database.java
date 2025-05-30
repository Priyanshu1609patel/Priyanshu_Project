package dbclasses;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.rowset.serial.SerialBlob;
import rateit.entities.Company;

public class Company_database {

    Connection con;

    public Company_database(Connection con) {
        this.con = con;
    }

    public boolean RegisterCompany(Company cmp) {
        boolean f = false;

        try {
            String query = "insert into company(COMPANY_NAME,COMPANY_MAIL,COMPANY_PHONE,COMPANY_URL,COMPANY_PASSWORD,CATEGORY) values(?,?,?,?,?,?)";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, cmp.getCOMPANY_NAME());
            stmt.setString(2, cmp.getCOMPANY_MAIL());
            stmt.setLong(3, cmp.getCOMPANY_PHONE());
            stmt.setString(4, cmp.getCOMPANY_URL());
            stmt.setString(5, cmp.getCOMPANY_PASSWORD());
            stmt.setString(6, cmp.getCATEGORY());

            int i = stmt.executeUpdate();
            if (i > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Company getCompanyByEmail(String Login, String password) {
        Company cmp = null;
        try {
            String query = "select * from company where COMPANY_LOGIN=? and COMPANY_PASSWORD =?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setString(1, Login);
            stmt.setString(2, password);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                cmp = new Company();

                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cmp;

    }

    public ArrayList<Company> getAllCompanies() {
        ArrayList<Company> list = new ArrayList<>();
        try {
            String query = "select * from company";

            PreparedStatement stmt = this.con.prepareStatement(query);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                Company cmp = new Company();
                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));

                list.add(cmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Company getCompanyByName(String COMPANY_NAME) {
        Company cmp = null;
        try {
            String query = "select * from company where COMPANY_NAME=?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setString(1, COMPANY_NAME);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                cmp = new Company();

                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cmp;

    }

    public Blob getCompanyImage(String COMPANY_NAME) {
        Blob blob = null;

        try {
            String query = "select COMPANY_IMG from company where COMPANY_NAME=?";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, COMPANY_NAME);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                blob = set.getBlob("COMPANY_IMG");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return blob;
    }

    public boolean UpdateCompanyProfile(String COMPANY_NAME, String COMPANY_MAIL, int COMPANY_ID) {
        boolean f = false;
        try {
            String query = "update company set COMPANY_NAME=? ,COMPANY_MAIL=? where COMPANY_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, COMPANY_NAME);
            stmt.setString(2, COMPANY_MAIL);
            stmt.setInt(3, COMPANY_ID);

            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public Company getCompanyById(int Company_id) {
        Company cmp = null;
        try {
            String query = "select * from company where COMPANY_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, Company_id);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                cmp = new Company();

                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cmp;

    }

    public boolean removeCompany(int cmp_id) {
        boolean f = false;
        try {
            String query = "delete from company where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, cmp_id);
            stmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public ArrayList<Company> getRegisterCompanies() {
        ArrayList<Company> list = null;
        try {
            String query = "select * from company where COMPANY_LOGIN IS NULL";

            PreparedStatement stmt = this.con.prepareStatement(query);

            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }

            while (set.next()) {
                Company cmp = new Company();
                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));
                list.add(cmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean UpdateCompany(Company cmp) {
        boolean f = false;

        try {
            String query = "Update company set COMPANY_NAME=?,COMPANY_MAIL=?,CATEGORY=?,COMPANY_LOGIN=? where COMPANY_ID=?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, cmp.getCOMPANY_NAME());
            stmt.setString(2, cmp.getCOMPANY_MAIL());
            stmt.setString(3, cmp.getCATEGORY());
            stmt.setString(4, cmp.getCOMPANY_LOGIN());
            stmt.setInt(5, cmp.getCOMPANY_ID());

            int i = stmt.executeUpdate();
            if (i > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean UploadImage(InputStream is, int COMPANY_ID) {
        boolean f = false;
        try {
            String query = "Update company set COMPANY_IMG=? where COMPANY_ID=?";
            byte[] b = new byte[is.available()];
            is.read(b);
            Blob blob = new SerialBlob(b);
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setBlob(1, blob);
            stmt.setInt(2, COMPANY_ID);
            if (stmt.executeUpdate() > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public ArrayList<Company> getCompanyByName1(String COMPANY_NAME) {
        ArrayList<Company> list = new ArrayList<>();
        try {
            String query = "select * from company where COMPANY_NAME LIKE ?";

            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setString(1, COMPANY_NAME);

            ResultSet set = stmt.executeQuery();

            while (set.next()) {
                Company cmp = new Company();

                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));
                list.add(cmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public ArrayList<Company> getPollrequets() {
        ArrayList<Company> list = null;
        try {
            String query = "select * from company where CURRENT_POLL_STATUS=1";

            PreparedStatement stmt = this.con.prepareStatement(query);

            ResultSet set = stmt.executeQuery();
            if (set.isBeforeFirst()) {
                list = new ArrayList<>();

            }

            while (set.next()) {
                Company cmp = new Company();
                cmp.setCOMPANY_ID(set.getInt("COMPANY_ID"));
                cmp.setCOMPANY_LOGIN(set.getString("COMPANY_LOGIN"));
                cmp.setCOMPANY_PASSWORD(set.getString("COMPANY_PASSWORD"));
                cmp.setCOMPANY_NAME(set.getString("COMPANY_NAME"));
                cmp.setCOMPANY_MAIL(set.getString("COMPANY_MAIL"));
                cmp.setCATEGORY(set.getString("CATEGORY"));
                cmp.setRANK(set.getInt("RANK"));
                cmp.setPOLL(set.getInt("POLLS"));
                cmp.setACP_COUNT(set.getInt("ACP_COUNT"));
                cmp.setSCP_COUNT(set.getInt("SCP_COUNT"));
                cmp.setJOIN_DATE(set.getTimestamp("JOIN_DATE"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCURRENT_POLL_STATUS(set.getBoolean("CURRENT_POLL_STATUS"));
                cmp.setCOMPANY_URL(set.getString("COMPANY_URL"));
                cmp.setCOMPANY_PHONE(set.getLong("COMPANY_PHONE"));
                cmp.setCOMPANY_IMG(set.getBlob("COMPANY_IMG"));
                cmp.setCOMPANY_RATE(set.getInt("COMPANY_RATE"));
                cmp.setCOMPANY_DESC(set.getString("COMPANY_DESC"));
                list.add(cmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updatePollStatus0(int Company_id) {
        boolean b = false;
        try {
            String query = "Update company set CURRENT_POLL_STATUS=0 where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, Company_id);

            int i = stmt.executeUpdate();
            if (i > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean updatePollStatus1(int Company_id) {
        boolean b = false;
        try {
            String query = "Update company set CURRENT_POLL_STATUS=1 where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, Company_id);

            int i = stmt.executeUpdate();
            if (i > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean updateRank(int cmp_id, int rank) {
        boolean f = false;
        try {
            String query = "update company set COMPANY_RATE=? where COMPANY_ID=?";
            PreparedStatement stmt = this.con.prepareStatement(query);

            stmt.setInt(1, rank);
            stmt.setInt(2, cmp_id);
            stmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public int getTotalCompany() {
        int i = 0;

        try {

            String query = "select COUNT(COMPANY_ID) from company";

            PreparedStatement stmt = this.con.prepareStatement(query);
            ResultSet set = stmt.executeQuery();

            if (set.next()) {
                i = set.getInt("COUNT(COMPANY_ID)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

   }
