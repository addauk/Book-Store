require_relative '../lib/book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).

  it 'returns a list of all books' do
    repo = BookRepository.new

    books = repo.all

    books.length # =>  2

    books[0].id # =>  1
    books[0].title # =>  'Nineteen Eighty-Four'
    books[0].author_name # =>  'George Orwell'

    books[1].id # =>  2
    books[1].title # =>  'Mrs Dalloway'
    books[1].author_name # =>  'Virginia Woolf'
  end
end