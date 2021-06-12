package g;


public class DebitTrans {
    int transid;
    int debit;
    String fetched_email;
    long phone;
    int updated_balance;

    public DebitTrans() {
    }

    public DebitTrans(int transid, int debit, String fetched_email, long phone, int updated_balance) {
        this.transid = transid;
        this.debit = debit;
        this.fetched_email = fetched_email;
        this.phone = phone;
        this.updated_balance = updated_balance;
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
        return updated_balance;
    }

    
}