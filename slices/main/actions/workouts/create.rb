module Main
  module Actions
    module Workouts
      class Create < Action
        include Deps["geo.gpx_parser", "commands.workouts.create"]

        def handle(req, res)
          tempfile = Tempfile.new(%w[path .gpx])

          if !req.params.to_h.dig(:file, :tempfile).nil?
            tempfile.write req.params[:file][:tempfile].read
          else
            tempfile.write req.params[:file]
          end

          tempfile.rewind

          gpxfile = gpx_parser.call(path: tempfile.path)

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
