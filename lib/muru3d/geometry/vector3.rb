module Muru3d
  module Geometry
    class Vector3
      attr_accessor :x
      attr_accessor :y
      attr_accessor :z

      def initialize(x, y, z)
        @x = x
        @y = y
        @z = z
      end

      def self.unit_x
        new(1, 0, 0)
      end

      def self.unit_y
        new(0, 1, 0)
      end

      def self.unit_z
        new(0, 0, 1)
      end

      def self.zero
        new(0, 0, 0)
      end
    end
  end
end
