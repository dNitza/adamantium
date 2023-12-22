# frozen_string_literal: true

module Admin
  module Views
    module Books
      class Index < Admin::View
      
        include Deps["repos.book_repo"]
        
        expose :books do
          book_repo.list_all
        end
      end
    end
  end
end
