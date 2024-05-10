package mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pennant.JdbcConnections.JDBCUtils;

public class HSNCodesDAOImpl implements HSNCodesDAO {
	@Override
	public double getGSTByHSNCode(String hsnCode) {
		// Implement the logic to fetch the GST percentage for the given HSN code from the database
		// Assume you have a database connection and statement prepared here
		double gstPercentage = 0.0; // Default value

		try {
			String query = "SELECT hsnc_gstc_percentage FROM HSNCodes WHERE hsnc_hsncode = ?";
			Connection conn = JDBCUtils.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, hsnCode);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				gstPercentage = resultSet.getDouble("hsnc_gstc_percentage");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Handle exception
		}

		return gstPercentage;
	}
}