module Muru3d
  module Geometry
    class Vertex
      attr_accessor :position
      attr_accessor :normal
      attr_accessor :edges

      def initialize(position, normal = Vector3.zero)
        @position = position
        @normal = normal
        @edges = []
      end
    end
  end
end
