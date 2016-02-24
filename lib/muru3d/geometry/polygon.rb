module Muru3d
  module Geometry
    class Vertex
      attr_accessor :vertices
      attr_accessor :edges

      def initialize(vertices = [], edges = [])
        @vertices = vertices
        @edges = edges
      end
    end
  end
end
