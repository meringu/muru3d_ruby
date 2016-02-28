module Muru3d
  module Geometry
    class Polygon
      include GL

      attr_accessor :vertices
      attr_accessor :edges

      def initialize(vertices = [], edges = [])
        @vertices = vertices
        @edges = edges
      end

      def center
        vertices.map(&:position).inject(&:+) / vertices.length
      end

      def draw
        glBegin(GL_POLYGON)
        vertices.each do |vertex|
          glNormal3f(0, 1, 0)
          glVertex3f(*vertex.position.xyz)
        end
        glEnd
      end
    end
  end
end
