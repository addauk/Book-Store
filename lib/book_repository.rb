require_relative './book'

class BookRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT id, title, author_name FROM books;'
    all_books = []
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |result|
      book = Book.new
      book.id = result['id']
      book.title = result['title']
      book.author_name = result['author_name']
      all_books << book
    end

    return all_books

    # Returns an array of Book objects.
  end

end