package mvc;
public class GSTCalculator {
	private HSNCodesDAO hsncodesDAO;

	public GSTCalculator() {
		this.hsncodesDAO = new HSNCodesDAOImpl();
	}

	public double calculateGST(String hsnCode, double price) {
		double gstPercentage = hsncodesDAO.getGSTByHSNCode(hsnCode);
		double gstAmount = (price * gstPercentage) / 100;
		return gstAmount;
	}

	public double calculateTotalPrice(String hsnCode, double price) {
		double gstAmount = calculateGST(hsnCode, price);
		double totalPrice = price + gstAmount;
		return totalPrice;
	}
}
