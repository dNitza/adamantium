module Admin
  module Views
    module AutoTagging
      class New < Admin::View

        include Deps["repos.tag_repo"]

        expose :tags do
          tag_repo.list.to_a
        end

        expose :errors do |errors:|
          errors.empty? ? nil : errors.to_h
        end
      end
    end
  end
end