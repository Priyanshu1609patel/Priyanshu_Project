package rateit.entities;

public class Review {
   
    private int REVIEW_ID;
    private int POLL_ID;
    private int COMPANY_ID;
    private int USER_ID;
    private String SERVICES;
    private String COMMENT;
    private float RATE;

    public Review() {
    }

    public Review(int REVIEW_ID, int POLL_ID, int COMPANY_ID, int USER_ID, String SERVICES, String COMMENT, float RATE) {
        this.REVIEW_ID = REVIEW_ID;
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.USER_ID = USER_ID;
        this.SERVICES = SERVICES;
        this.COMMENT = COMMENT;
        this.RATE = RATE;
    }

    public Review(int POLL_ID, int COMPANY_ID, int USER_ID, String SERVICES, float RATE) {
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.USER_ID = USER_ID;
        this.SERVICES = SERVICES;
        this.RATE = RATE;
    }
    public Review(int COMPANY_ID, int USER_ID, String SERVICES, float RATE) {
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.USER_ID = USER_ID;
        this.SERVICES = SERVICES;
        this.RATE = RATE;
    }
    
    public Review(int POLL_ID, int COMPANY_ID, int USER_ID, String SERVICES, String COMMENT, float RATE) {
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.USER_ID = USER_ID;
        this.SERVICES = SERVICES;
        this.COMMENT = COMMENT;
        this.RATE = RATE;
    }
    public Review(int COMPANY_ID, int USER_ID, String SERVICES, String COMMENT, float RATE) {
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.USER_ID = USER_ID;
        this.SERVICES = SERVICES;
        this.COMMENT = COMMENT;
        this.RATE = RATE;
    }

    public int getREVIEW_ID() {
        return REVIEW_ID;
    }

    public void setREVIEW_ID(int REVIEW_ID) {
        this.REVIEW_ID = REVIEW_ID;
    }

    public int getPOLL_ID() {
        return POLL_ID;
    }

    public void setPOLL_ID(int POLL_ID) {
        this.POLL_ID = POLL_ID;
    }

    public int getCOMPANY_ID() {
        return COMPANY_ID;
    }

    public void setCOMPANY_ID(int COMPANY_ID) {
        this.COMPANY_ID = COMPANY_ID;
    }

    public int getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(int USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getSERVICES() {
        return SERVICES;
    }

    public void setSERVICES(String SERVICES) {
        this.SERVICES = SERVICES;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT;
    }

    public float getRATE() {
        return RATE;
    }

    public void setRATE(float RATE) {
        this.RATE = RATE;
    }
    
    
    
    
}
