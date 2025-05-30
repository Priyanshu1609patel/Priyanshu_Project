
package rateit.entities;


public class Company_services {
    
    private int COMPANY_ID;
    private String COMPANY_SERVICES;
    private String CATEGORY;

    public Company_services() {
    }

    public Company_services(int COMPANY_ID, String COMPANY_SERVICES, String CATEGORY) {
        this.COMPANY_ID = COMPANY_ID;
        this.COMPANY_SERVICES = COMPANY_SERVICES;
        this.CATEGORY = CATEGORY;
    }

    public int getCOMPANY_ID() {
        return COMPANY_ID;
    }

    public void setCOMPANY_ID(int COMPANY_ID) {
        this.COMPANY_ID = COMPANY_ID;
    }

    public String getCOMPANY_SERVICES() {
        return COMPANY_SERVICES;
    }

    public void setCOMPANY_SERVICES(String COMPANY_SERVICES) {
        this.COMPANY_SERVICES = COMPANY_SERVICES;
    }

    public String getCATEGORY() {
        return CATEGORY;
    }

    public void setCATEGORY(String CATEGORY) {
        this.CATEGORY = CATEGORY;
    }
    
    
}
