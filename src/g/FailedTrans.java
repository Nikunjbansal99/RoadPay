package g;


public class FailedTrans {
    int transid;
    int debit;
    String fetched_email;
    long phone;
    int fetched_balance;

    public FailedTrans() {
    }

    public FailedTrans(int transid, int debit, String fetched_email, long phone, int fetched_balance) {
        this.transid = transid;
        this.debit = debit;
        this.fetched_email = fetched_email;
        this.phone = phone;
        this.fetched_balance = fetched_balance;
    }

    public int gettransid() {
        return transid;
    }
    
    public int getdebit() {
        return debit;
    }
    
    public String getEmail() {
        return fetched_email;
    }
    
    public long getPhone() {
        return phone;
    }

    public int getbalance() {
        return fetched_balance;
    }

    
}