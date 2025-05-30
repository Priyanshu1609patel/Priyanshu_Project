
package rateit.entities;

import java.sql.Blob;
import java.sql.Timestamp;

public class Company {
    
    private int COMPANY_ID;
    private String COMPANY_NAME;
    private String COMPANY_MAIL;
    private String COMPANY_LOGIN;
    private String COMPANY_PASSWORD;
    private String CATEGORY;
    private int RANK;
    private int POLL;
    private int ACP_COUNT;
    private int SCP_COUNT;
    private Timestamp JOIN_DATE;
    private boolean CURRENT_POLL_STATUS;
    private Blob COMPANY_IMG;
    private String COMPANY_URL;
    private long COMPANY_PHONE;
    private int COMPANY_RATE;
    private String COMPANY_DESC;
    
    public Company() {
    }

    public Company(int COMPANY_ID, String COMPANY_NAME, String COMPANY_MAIL, String COMPANY_LOGIN, String COMPANY_PASSWORD, String CATEGORY, int RANK, int POLL, int ACP_COUNT, int SCP_COUNT, Timestamp JOIN_DATE, boolean CURRENT_POLL_STATUS, Blob COMPANY_IMG, String COMPANY_URL, long COMPANY_PHONE, int COMPANY_RATE, String COMPANY_DESC) {
        this.COMPANY_ID = COMPANY_ID;
        this.COMPANY_NAME = COMPANY_NAME;
        this.COMPANY_MAIL = COMPANY_MAIL;
        this.COMPANY_LOGIN = COMPANY_LOGIN;
        this.COMPANY_PASSWORD = COMPANY_PASSWORD;
        this.CATEGORY = CATEGORY;
        this.RANK = RANK;
        this.POLL = POLL;
        this.ACP_COUNT = ACP_COUNT;
        this.SCP_COUNT = SCP_COUNT;
        this.JOIN_DATE = JOIN_DATE;
        this.CURRENT_POLL_STATUS = CURRENT_POLL_STATUS;
        this.COMPANY_IMG = COMPANY_IMG;
        this.COMPANY_URL = COMPANY_URL;
        this.COMPANY_PHONE = COMPANY_PHONE;
        this.COMPANY_RATE = COMPANY_RATE;
        this.COMPANY_DESC = COMPANY_DESC;
    }

    
    
    public Company(String COMPANY_NAME, String COMPANY_MAIL, String COMPANY_PASSWORD, String COMPANY_URL, long COMPANY_PHONE,String CATEGORY) {
        this.COMPANY_NAME = COMPANY_NAME;
        this.COMPANY_MAIL = COMPANY_MAIL;
        this.COMPANY_PASSWORD = COMPANY_PASSWORD;
        this.COMPANY_URL = COMPANY_URL;
        this.COMPANY_PHONE = COMPANY_PHONE;
        this.CATEGORY = CATEGORY;
    }

    



    public int getCOMPANY_ID() {
        return COMPANY_ID;
    }

    public void setCOMPANY_ID(int COMPANY_ID) {
        this.COMPANY_ID = COMPANY_ID;
    }

    public String getCOMPANY_NAME() {
        return COMPANY_NAME;
    }

    public void setCOMPANY_NAME(String COMPANY_NAME) {
        this.COMPANY_NAME = COMPANY_NAME;
    }

    public String getCOMPANY_MAIL() {
        return COMPANY_MAIL;
    }

    public void setCOMPANY_MAIL(String COMPANY_MAIL) {
        this.COMPANY_MAIL = COMPANY_MAIL;
    }

    public String getCOMPANY_LOGIN() {
        return COMPANY_LOGIN;
    }

    public void setCOMPANY_LOGIN(String COMPANY_LOGIN) {
        this.COMPANY_LOGIN = COMPANY_LOGIN;
    }

    public String getCOMPANY_PASSWORD() {
        return COMPANY_PASSWORD;
    }

    public void setCOMPANY_PASSWORD(String COMPANY_PASSWORD) {
        this.COMPANY_PASSWORD = COMPANY_PASSWORD;
    }

    public String getCATEGORY() {
        return CATEGORY;
    }

    public void setCATEGORY(String CATEGORY) {
        this.CATEGORY = CATEGORY;
    }

    public int getRANK() {
        return RANK;
    }

    public void setRANK(int RANK) {
        this.RANK = RANK;
    }

    public int getPOLL() {
        return POLL;
    }

    public void setPOLL(int POLL) {
        this.POLL = POLL;
    }

    public int getACP_COUNT() {
        return ACP_COUNT;
    }

    public void setACP_COUNT(int ACP_COUNT) {
        this.ACP_COUNT = ACP_COUNT;
    }

    public int getSCP_COUNT() {
        return SCP_COUNT;
    }

    public void setSCP_COUNT(int SCP_COUNT) {
        this.SCP_COUNT = SCP_COUNT;
    }

    public Timestamp getJOIN_DATE() {
        return JOIN_DATE;
    }

    public void setJOIN_DATE(Timestamp JOIN_DATE) {
        this.JOIN_DATE = JOIN_DATE;
    }

    public boolean isCURRENT_POLL_STATUS() {
        return CURRENT_POLL_STATUS;
    }

    public void setCURRENT_POLL_STATUS(boolean CURRENT_POLL_STATUS) {
        this.CURRENT_POLL_STATUS = CURRENT_POLL_STATUS;
    }

    public Blob getCOMPANY_IMG() {
        return COMPANY_IMG;
    }

    public void setCOMPANY_IMG(Blob COMPANY_IMG) {
        this.COMPANY_IMG = COMPANY_IMG;
    }

    public String getCOMPANY_URL() {
        return COMPANY_URL;
    }

    public void setCOMPANY_URL(String COMPANY_URL) {
        this.COMPANY_URL = COMPANY_URL;
    }

    public long getCOMPANY_PHONE() {
        return COMPANY_PHONE;
    }

    public void setCOMPANY_PHONE(long COMPANY_PHONE) {
        this.COMPANY_PHONE = COMPANY_PHONE;
    }

    public int getCOMPANY_RATE() {
        return COMPANY_RATE;
    }

    public void setCOMPANY_RATE(int COMPANY_RATE) {
        this.COMPANY_RATE = COMPANY_RATE;
    }

    public String getCOMPANY_DESC() {
        return COMPANY_DESC;
    }

    public void setCOMPANY_DESC(String COMPANY_DESC) {
        this.COMPANY_DESC = COMPANY_DESC;
    }
    
    
    
    
    
            
            
    
}
