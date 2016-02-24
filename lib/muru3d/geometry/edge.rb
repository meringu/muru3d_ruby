module Muru3d
  module Geometry
    class Edge
      attr_accessor :a
      attr_accessor :b
      attr_accessor :faces

      def initialize(a, b)
        @a = a
        @b = b
        @faces = []
      end
    end
  end
end
