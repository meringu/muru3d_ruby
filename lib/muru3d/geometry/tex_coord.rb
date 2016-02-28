module Muru3d
  module Geometry
    class TexCoord
      attr_accessor :u
      attr_accessor :v
      attr_accessor :w

      def initialize(u, v, w = 0)
        @u = u
        @v = v
        @w = w
      end

      def self.zero
        new(0, 0)
      end
    end
  end
end
