require "babosa"
require "securerandom"

module Adamantium
  class SlugCreator
    def call(text:, checker:)
      input_slug = (text != "" && !text.nil?) ? text.to_slug.normalize.to_s : SecureRandom.uuid
      slug = input_slug

      suffix = 1

      while checker.call(slug)
        slug = "#{input_slug}-#{suffix}"
        suffix += 1
      end

      slug
    end
  end
end
