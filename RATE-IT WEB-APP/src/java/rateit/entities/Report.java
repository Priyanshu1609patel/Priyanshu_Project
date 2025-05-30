/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rateit.entities;

import java.sql.Blob;

public class Report {
   
    private int POLL_ID;
    private int COMPANY_ID;
    private Blob report;

    public Report() {
    }

    public Report(int POLL_ID, int COMPANY_ID, Blob report) {
        this.POLL_ID = POLL_ID;
        this.COMPANY_ID = COMPANY_ID;
        this.report = report;
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

    public Blob getReport() {
        return report;
    }

    public void setReport(Blob report) {
        this.report = report;
    }
    
    
    
    
    
}
