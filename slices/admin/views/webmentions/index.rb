# frozen_string_literal: true

module Admin
  module Views
    module Webmentions
      class Index < Admin::View
        include Deps["repos.webmention_repo"]

        expose :webmentions do
          webmention_repo.list_all
        end
      end
    end
  end
end
