module Adamantium
  module Actions
    module Workouts
      class Create < Action
        include Deps["geo.gpx_parser", "commands.workouts.create"]

        def handle(req, res)
          tempfile = Tempfile.new(%w/path .gpx/)
          tempfile.write req.params["file"]["tempfile"]
          tempfile.rewind

          gpxfile = gpx_parser.call(file: tempfile)

          if gpxfile.success?
            create.call(**gpxfile.value!)
            res.status = 201
          else
            res.status = 500
          end
        ensure
          tempfile.close
          tempfile.unlink
        end
      end
    end
  end
end
