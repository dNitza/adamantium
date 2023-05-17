module Adamantium
  class Context < Hanami::View::Context
    include Hanami::View::ContextHelpers::ContentHelpers

    def initialize(**options)
      @options = options
      super(**options)
    end

    def asset_from_manifest(filename)
      return "/assets/#{filename}" if Hanami.env != :production
      hashed_filename = asset_manifest[filename]
      "/assets/dist/#{hashed_filename}"
    end

    def link_active? path
      # TODO: waiting for Hanami View to be released
      # to access current_path
      false
    end

    private

    def asset_manifest
      @asset_manifest ||= JSON.parse(File.read("public/assets/asset-manifest.json"))
    end
  end
end
