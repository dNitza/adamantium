require "geo_ruby"
require "geo_ruby/gpx"
require "gnuplot"
require "dry/monads"

module Adamantium
  module Geo
    class GpxParser
      include Dry::Monads[:result]

      def call(file:)
        gpxfile = GeoRuby::Gpx4r::GpxFile.open(file.path)

        x = gpxfile.as_line_string.points.flat_map { |p| p.x }
        y = gpxfile.as_line_string.points.flat_map { |p| p.y }

        maxlat = y.max
        minlat = y.min

        maxlon = x.max
        minlon = x.min

        latdiff = maxlat - minlat
        londiff = maxlon - minlon

        svg = Gnuplot.open do |gp|
          Gnuplot::Plot.new(gp) do |plot|
            plot.arbitrary_lines << "unset border"
            plot.arbitrary_lines << "unset xtics"
            plot.arbitrary_lines << "unset ytics"
            plot.arbitrary_lines << "set size ratio -1"
            plot.arbitrary_lines << "set yrange [#{minlat}:#{maxlat}]" if latdiff >= londiff # portrait
            plot.arbitrary_lines << "set xrange [#{minlon}:#{maxlon}]" if latdiff < londiff # landscape
            plot.arbitrary_lines << "set term svg"
            plot.data << Gnuplot::DataSet.new([x, y]) do |ds|
              ds.with = "lines"
              ds.linewidth = 4
              ds.linecolor = 'rgb "#84cc16"'
              ds.notitle
            end
          end
        end

        svg.gsub!('width="600" height="480"', 'width="100%" height="100%"')
        # svg.gsub!('viewBox="0 0 600 480"', 'viewBox="0 0 100% 100%"')

        Success({svg: svg, distance: gpxfile.as_line_string.spherical_distance})
      end
    end
  end
end
