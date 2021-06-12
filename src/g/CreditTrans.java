package g;


public class CreditTrans {
    int transid;
    int credit;
    String fetched_email;
    long phone;
    int updated_balance;

    public CreditTrans() {
    }

    public CreditTrans(int transid, int credit, String fetched_email, long phone, int updated_balance) {
        this.transid = transid;
        this.credit = credit;
        this.fetched_email = fetched_email;
        this.phone = phone;
        this.updated_balance = updated_balance;
    }

    public int gettransid() {
        return transid;
    }
    
    public int getCredit() {
        return credit;
    }
    
    public String getEmail() {
        return fetched_email;
    }
    
    public long getPhone() {
        return phone;
    }

    public int getbalance() {
        return updated_balance;
    }

    
}