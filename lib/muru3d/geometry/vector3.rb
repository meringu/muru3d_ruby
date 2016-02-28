module Muru3d
  module Geometry
    class Vector3
      attr_accessor :x
      attr_accessor :y
      attr_accessor :z
      attr_accessor :w

      def initialize(x, y, z, w = 1.0)
        @x = x
        @y = y
        @z = z
        @w = w
      end

      def length
        Math.sqrt(x * x + y * y + z * z)
      end

      def unit
        self / length
      end

      def xyz
        [x, y, z]
      end

      def +(other)
        self.class.new(x + other.x, y + other.y, z + other.z)
      end

      def /(denominator)
        self.class.new(x / denominator, y / denominator, z / denominator)
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
