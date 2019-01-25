package RealCustomer.To;

public class RealCustomer {
    private int customerNumber;
    private String customerName;
    private String customerFamily;
    private String customersFatherName;
    private int nationalCode;
    private String dateOfBirth;

    public int getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(int customerNumber) {
        this.customerNumber = customerNumber;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCustomerFamily() {
        return customerFamily;
    }

    public void setCustomerFamily(String customerFamily) {
        this.customerFamily = customerFamily;
    }

    public String getCustomersFatherName() {
        return customersFatherName;
    }

    public void setCustomersFatherName(String customersFatherName) {
        this.customersFatherName = customersFatherName;
    }

    public int getNationalCode() {
        return nationalCode;
    }

    public void setNationalCode(int nationalCode) {
        this.nationalCode = nationalCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
