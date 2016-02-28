module Muru3d
  class Model
    attr_accessor :polygons
    attr_accessor :edges
    attr_accessor :vertices

    def initialize(polygons, edges, vertices)
      @polygons = polygons
      @edges = edges
      @vertices = vertices
    end

    def draw
      glEnable(GL_LIGHTING)
      glColor3f(1, 1, 1)
      @polygons.each(&:draw)
    end
  end
end
