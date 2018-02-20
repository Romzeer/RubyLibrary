class BooksController < ApplicationController

    http_basic_authenticate_with name: "admin", password: "admin", except: [:blog, :show]

    def index
        @page_title = 'Admin'
        @books = Book.all.paginate(page: params[:page], per_page: 10)
        render layout: 'admin'
    end

    def blog
        @page_title = 'Welcome on the blog'
        if params[:search]
            @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 8)
        else
            @books = Book.all.paginate(page: params[:page], per_page: 8)
            render layout: 'application'
            @page_title = 'News list'
        end
    end

    def show
        @book = Book.find(params[:id])
        @page_title = "#{@book.title}"
        @comment = @book.comments.all
    end

    def new
        @session = session
        @book = Book.new
        @categories = Category.all.map{|c| [ c.name, c.id ] }
        @auteurs = Auteur.all.map{|a| [ a.name, a.id ] }
        @page_title = 'Add a Book'
        render layout: 'admin'
    end

    def create
      @book = Book.new(book_params)
      @book.category_id = params[:category_id]
      @book.auteurs_id = params[:auteur_id]
      if @book.save
        redirect_to @book,
          notice: 'Book enregristré'
      else
        render 'new',
          layout: 'admin'
      end
    end

    def edit
        @book = Book.find(params[:id])
        @categories = Category.all.map{|c| [ c.name, c.id ] }
        @auteurs = Auteur.all.map{|a| [ a.name, a.id ] }
        @page_title = "Edit #{@book.title}"
        render layout: 'admin'
    end

    def update
        @book = Book.find(params[:id])
        @book.category_id = params[:category_id]
        @book.auteur_id = params[:auteur_id]
        if @book.update(book_params)
            redirect_to @book,
            notice: 'Book enregristré'
        else
            render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end


    private
    def book_params
        params.require(:book).permit(:title,:text,:image)
    end
end
