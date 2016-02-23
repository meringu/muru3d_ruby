module Muru3d
  class Window < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = 'Muru3d'
    end

    def update
    end

    def draw
      gl do
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity
        gluPerspective(45.0, width / height, 0.1, 100.0)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity

        glTranslatef(0, 0, -5)

        glBegin(GL_QUADS)
          glVertex3f(-1,  1, 0)
          glVertex3f(1,  1, 0)
          glVertex3f( 1, -1, 0)
          glVertex3f(-1, -1, 0)
        glEnd
      end
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end
  end
end
