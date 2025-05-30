
package rateit.entities;

import java.sql.Timestamp;


public class Poll {
   
    
    private int POLL_NO;
    private int POLL_ID;
    private Timestamp START_DATE;
    private Timestamp END_DATE;
    private int COMPANY1;
    private int COMPANY2;
    private String CATEGORY;
    private int REMOVE_THIS;

    public Poll() {
    }

    public Poll(int POLL_NO, int POLL_ID, Timestamp START_DATE, Timestamp END_DATE, int COMPANY1, int COMPANY2, String CATEGORY, int REMOVE_THIS) {
        this.POLL_NO = POLL_NO;
        this.POLL_ID = POLL_ID;
        this.START_DATE = START_DATE;
        this.END_DATE = END_DATE;
        this.COMPANY1 = COMPANY1;
        this.COMPANY2 = COMPANY2;
        this.CATEGORY = CATEGORY;
        this.REMOVE_THIS = REMOVE_THIS;
    }
    public Poll(int POLL_ID, int COMPANY1, int COMPANY2, String CATEGORY) {
    
        this.POLL_ID = POLL_ID;
      
        this.COMPANY1 = COMPANY1;
        this.COMPANY2 = COMPANY2;
        this.CATEGORY = CATEGORY;
        
    }

    public int getPOLL_NO() {
        return POLL_NO;
    }

    public void setPOLL_NO(int POLL_NO) {
        this.POLL_NO = POLL_NO;
    }

    public int getPOLL_ID() {
        return POLL_ID;
    }

    public void setPOLL_ID(int POLL_ID) {
        this.POLL_ID = POLL_ID;
    }

    public Timestamp getSTART_DATE() {
        return START_DATE;
    }

    public void setSTART_DATE(Timestamp START_DATE) {
        this.START_DATE = START_DATE;
    }

    public Timestamp getEND_DATE() {
        return END_DATE;
    }

    public void setEND_DATE(Timestamp END_DATE) {
        this.END_DATE = END_DATE;
    }

    public int getCOMPANY1() {
        return COMPANY1;
    }

    public void setCOMPANY1(int COMPANY1) {
        this.COMPANY1 = COMPANY1;
    }

    public int getCOMPANY2() {
        return COMPANY2;
    }

    public void setCOMPANY2(int COMPANY2) {
        this.COMPANY2 = COMPANY2;
    }

    public String getCATEGORY() {
        return CATEGORY;
    }

    public void setCATEGORY(String CATEGORY) {
        this.CATEGORY = CATEGORY;
    }

    public int getREMOVE_THIS() {
        return REMOVE_THIS;
    }

    public void setREMOVE_THIS(int REMOVE_THIS) {
        this.REMOVE_THIS = REMOVE_THIS;
    }
    
    
    
}
