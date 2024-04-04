package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import book.DB;

public class BookDAO {
	private static Book getBookFrom(ResultSet resultSet) throws SQLException {
		Book book = new Book();
		book.setId(resultSet.getInt("id"));
		book.setTitle(resultSet.getString("title"));
		book.setAuthor(resultSet.getString("author"));
		book.setCategoryId(resultSet.getInt("categoryId"));
		book.setPrice(resultSet.getInt("price"));
		book.setPublisher(resultSet.getString("publisher"));
		book.setCategoryName(resultSet.getString("categoryName"));
		return book;
	}

	public static List<Book> findAll() throws Exception {
		String sql = "SELECT b.*, c.categoryName " + " FROM book b LEFT JOIN category c ON b.categoryId = c.id";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<Book> list = new ArrayList<Book>();
			while (resultSet.next())
				list.add(getBookFrom(resultSet));
			return list;
		}
	}

	public static Book findByName(String title) throws Exception {
		String sql = "SELECT b.*, c.categoryName " + " FROM book b LEFT JOIN category c ON b.categoryId = c.id "
				+ " WHERE b.title = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, title);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next())
					return getBookFrom(resultSet);
				else
					return null;
			}
		}
	}

	public static Book findById(int id) throws Exception {
		String sql = "SELECT b.*, c.categoryName " + " FROM book b LEFT JOIN category c ON b.categoryId = c.id "
				+ " WHERE b.id = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next())
					return getBookFrom(resultSet);
				else
					return null;
			}
		}
	}

	public static void insert(Book book) throws Exception {
		String sql = "INSERT book (title, author, categoryId, price, publisher)" + " VALUES (?, ?, ?, ?, ?)";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, book.getTitle());
			statement.setString(2, book.getAuthor());
			statement.setInt(3, book.getCategoryId());
			statement.setInt(4, book.getPrice());
			statement.setString(5, book.getPublisher());
			statement.executeUpdate();
		}
	}

	public static void update(Book book) throws Exception {
		String sql = "UPDATE book SET title=?, author=?, categoryId=?, price=?, publisher=? " + " WHERE id = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, book.getTitle());
			statement.setString(2, book.getAuthor());
			statement.setInt(3, book.getCategoryId());
			statement.setInt(4, book.getPrice());
			statement.setString(5, book.getPublisher());
			statement.setInt(6, book.getId());
			statement.executeUpdate();
		}
	}

	public static void delete(int id) throws Exception {
		String sql = "DELETE FROM book WHERE id = ?";
		try (Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}
}
