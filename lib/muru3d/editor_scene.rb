module Muru3d
  class EditorScene
    class << self
      include GL

      def level
        10 ** (Math.log10(Camera.zoom).to_i - 1)
      end

      def draw
        glDisable(GL_LIGHTING)
      	glLineWidth(1)
      	glBegin(GL_LINES)

        draw_grid
        draw_axis

      	glEnd
      end

      def draw_axis
        # x axis
      	glColor3f(1, 0, 0)
      	glVertex3f(0, 0, 0)
      	glVertex3f(1000, 0, 0)
      	# y axis
      	glColor3f(0, 1, 0)
      	glVertex3f(0, 0, 0)
      	glVertex3f(0, 1000, 0)
      	# z axis
      	glColor3f(0, 0, 1)
      	glVertex3f(0, 0, 0)
      	glVertex3f(0, 0, 1000)
      end

      def draw_grid
        glColor3f(0.3, 0.3, 0.3)
      	(-10..10).each do |x|
      		if x == 0
      			glVertex3f(x * level, 0, 0)
      			glVertex3f(x * level, 0, -10 * level)
      		else
      			glVertex3f(x * level, 0, 10 * level)
      			glVertex3f(x * level, 0, -10 * level)
      		end
      	end
        (-10..10).each do |z|
      		if z == 0
      			glVertex3f(0, 0, z * level)
      			glVertex3f(-10 * level, 0, z * level)
      		else
      			glVertex3f(10 * level, 0, z * level)
      			glVertex3f(-10 * level, 0, z * level)
      	  end
      	end
      end

      def set_lighting
        direction = [ 0.0, 0.0, 1.0, 0.0]
        diffintensity = [0.7, 0.7, 0.7, 1.0]
        ambient = [0.2, 0.2, 0.2, 1.0]
        glLightfv(GL_LIGHT0, GL_POSITION, direction)
        glLightfv(GL_LIGHT0, GL_DIFFUSE, diffintensity)
        glLightfv(GL_LIGHT0, GL_AMBIENT, ambient)
        glEnable(GL_LIGHT0)
      end
    end
  end
end
