# frozen_string_literal: false

# auto_register: false

module Adamantium
  module Decorators
    module Books
      class Decorator < SimpleDelegator
        def display_published_at
          published_at.strftime("%e %B, %Y")
        end

        def machine_published_at
          published_at.rfc2822
        end

        def syndicated?
          !syndication_sources.empty?
        end

        def template_type
          :book
        end

        def authors
          self.book_author.split(";").join(" ")
        end

        def status_colour
          case book_status
          when "read" || "finished"
            "text-green-100 bg-green-500"
          when "to-read"
            "text-blue-100 bg-blue-500"
          when "reading"
            "text-orange-100 bg-orange-500"
          end
        end

        def status_label
          case book_status
          when "read" || "finished"
            "Read"
          when "to-read"
            "To read"
          when "reading"
            "Reading"
          end
        end
      end
    end
  end
end
