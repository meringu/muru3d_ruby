module Muru3d
  module Geometry
    class Vertex
      attr_accessor :position
      attr_accessor :tex_coord
      attr_accessor :normal
      attr_accessor :edges

      def initialize(opts = {})
        @position = opts.fetch(:position) { Vector3.zero }
        @tex_coord = opts.fetch(:tex_coord) { TexCoord.zero }
        @normal = opts.fetch(:normal) { Vector3.zero }
        @edges = opts.fetch(:edges) { [] }
      end
    end
  end
end
