class WelcomeController < ApplicationController
  def index
    @page_title = 'Welcome on the blog'
    @books = Book.last(4)
  end
end
