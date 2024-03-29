module Admin
  module Views
    module MergeTags
      class New < Admin::View
        include Deps["repos.tag_repo"]

        expose :post_tag do |id:|
          tag_repo.fetch(id)
        end

        expose :post_tags do |id:|
          tag_repo.list.reject { |t| t.id.to_s == id.to_s }
        end
      end
    end
  end
end
