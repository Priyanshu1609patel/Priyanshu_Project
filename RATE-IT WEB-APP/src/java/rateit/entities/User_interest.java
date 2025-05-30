
package rateit.entities;


public class User_interest {
    
    private int USER_ID;
    private String INTEREST;

    public User_interest() {
    }

    public User_interest(int USER_ID, String INTEREST) {
        this.USER_ID = USER_ID;
        this.INTEREST = INTEREST;
    }

    public int getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(int USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getINTEREST() {
        return INTEREST;
    }

    public void setINTEREST(String INTEREST) {
        this.INTEREST = INTEREST;
    }
    
    
}
