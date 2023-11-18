module Admin
  module Views
    module Pages
      class Index < Admin::View
        include Deps["repos.page_repo"]

        expose :published_pages do |pages|
          pages[0]
        end

        expose :unpublished_pages do |pages|
          pages[1]
        end

        expose :pages do
          page_repo.list.partition { |p| p.published_at }
        end
      end
    end
  end
end
