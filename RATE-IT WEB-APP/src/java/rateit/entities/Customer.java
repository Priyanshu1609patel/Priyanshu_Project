
package rateit.entities;

import java.sql.Blob;
import java.sql.Timestamp;


public class Customer {
    
    private int USER_ID;
    private String USER_NAME;
    private String EMAIL;
    private String PASSWORD;
    private boolean LOGIN_STATUS;
    private int ATTENDED_POLL;
    private int REMAINDER;
    private Timestamp JOIN_DATE;
    private Blob PROFILE_IMG;
    
    public Customer(int USER_ID, String USER_NAME, String EMAIL, String PASSWORD, boolean LOGIN_STATUS, int ATTENDED_POLL, int REMAINDER, Timestamp JOIN_DATE) {
        this.USER_ID = USER_ID;
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.LOGIN_STATUS = LOGIN_STATUS;
        this.ATTENDED_POLL = ATTENDED_POLL;
        this.REMAINDER = REMAINDER;
        this.JOIN_DATE = JOIN_DATE;
    }

    public Customer(int USER_ID, String USER_NAME, String EMAIL, String PASSWORD, boolean LOGIN_STATUS, int ATTENDED_POLL, int REMAINDER, Timestamp JOIN_DATE, Blob PROFILE_IMG) {
        this.USER_ID = USER_ID;
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.LOGIN_STATUS = LOGIN_STATUS;
        this.ATTENDED_POLL = ATTENDED_POLL;
        this.REMAINDER = REMAINDER;
        this.JOIN_DATE = JOIN_DATE;
        this.PROFILE_IMG = PROFILE_IMG;
    }
    
    

    public Customer() {
    }

    public Customer(String USER_NAME, String EMAIL, String PASSWORD) {
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
    }

    public Customer(String USER_NAME, String EMAIL, String PASSWORD, boolean LOGIN_STATUS, int ATTENDED_POLL, int REMAINDER, Timestamp JOIN_DATE) {
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.LOGIN_STATUS = LOGIN_STATUS;
        this.ATTENDED_POLL = ATTENDED_POLL;
        this.REMAINDER = REMAINDER;
        this.JOIN_DATE = JOIN_DATE;
    }
    
    //setter for setting the value of members

    public void setUSER_ID(int USER_ID) {
        this.USER_ID = USER_ID;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public void setLOGIN_STATUS(boolean LOGIN_STATUS) {
        this.LOGIN_STATUS = LOGIN_STATUS;
    }

    public void setATTENDED_POLL(int ATTENDED_POLL) {
        this.ATTENDED_POLL = ATTENDED_POLL;
    }

    public void setREMAINDER(int REMAINDER) {
        this.REMAINDER = REMAINDER;
    }

    public void setJOIN_DATE(Timestamp JOIN_DATE) {
        this.JOIN_DATE = JOIN_DATE;
    }
    
    //getters for geting the value of members

    public int getUSER_ID() {
        return USER_ID;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public boolean isLOGIN_STATUS() {
        return LOGIN_STATUS;
    }

    public int getATTENDED_POLL() {
        return ATTENDED_POLL;
    }

    public int getREMAINDER() {
        return REMAINDER;
    }

    public Timestamp getJOIN_DATE() {
        return JOIN_DATE;
    }

    public Blob getPROFILE_IMG() {
        return PROFILE_IMG;
    }

    public void setPROFILE_IMG(Blob PROFILE_IMG) {
        this.PROFILE_IMG = PROFILE_IMG;
    }
    
    
    
    
}
