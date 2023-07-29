require "readability"
require "down"

module Adamantium
  class PageCacher
    def call(url:, &block)
      tempfile = Down.download(url)
      content = Readability::Document.new(tempfile.read, tags: %w[div section header p h1 h2 h3 h4 h5 h6 ol ul li table td tr thead tbody a code pre], attributes: %w[href]).content
      yield content
    end
  end
end
