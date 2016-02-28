module Muru3d
  module Parser
    class Obj
      def initialize(raw)
        @raw = raw
      end

      def model
        Model.new(polygons, edges, vertices)
      end

      private

      def lines
        @lines ||= @raw.split("\n")
      end

      def raw
        @raw
      end

      def edges

      end

      def vertices

      end

      def vertices
        @vertices = lines.select { |x| x =~ /\Av / }.map do |x|
          Geometry::Vector3.new(*x.split(" ").drop(1).map(&:to_f))
        end
      end

      def normals
        @normals = lines.select { |x| x =~ /\Avn / }.map do |x|
          Geometry::Vector3.new(*x.split(" ").drop(1).map(&:to_f)).unit
        end
      end

      def tex_coords
        @tex_coords = lines.select { |x| x =~ /\Avt / }.map do |x|
          Geometry::TexCoord.new(*x.split(" ").drop(1).map(&:to_f))
        end
      end

      def polygons
        @polygons = lines.select { |x| x =~ /\Af / }.map do |poly|
          Geometry::Polygon.new(poly.split(' ').drop(1).map do |vertex|
            indecies = vertex.split('/').map(&:to_i)
            raise if vertices[indecies[0]-1].nil?
            opts = { position: vertices[indecies[0]-1] }
            opts.merge!(tex_coord: tex_coords[indecies[1]-1]) unless tex_coords[1].nil?
            opts.merge!(normal: normals[indecies[2]-1]) unless normals[2].nil?
            Geometry::Vertex.new(opts)
          end)
        end
      end
    end
  end
end
