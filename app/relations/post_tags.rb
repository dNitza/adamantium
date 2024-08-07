# frozen_string_literal: true

module Adamantium
  module Relations
    class PostTags < Adamantium::DB::Relation
      schema :post_tags, infer: true do
        associations do
          belongs_to :post
          belongs_to :tag
        end
      end

      auto_struct(true)
    end
  end
end
