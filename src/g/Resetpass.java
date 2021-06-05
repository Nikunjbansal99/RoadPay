package g;


public class Resetpass {
    String email;
    long phone;
    String code;

    public Resetpass() {
    }

    public Resetpass(long phone, String email, String code) {
        this.phone = phone;
        this.email = email;
        this.code = code;
    }

    public long getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }


    public String getCode() {
        return code;
    }

    
}