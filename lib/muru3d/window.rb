module Muru3d
  class Window < Gosu::Window
    include GL

    def initialize
      super(1280, 720, false)
      self.caption = 'Muru3d'
      @model = Parser.open_file('spec/fixtures/models/box.obj')
      Camera.initialize
    end

    def update
      Mouse.update(mouse_x, mouse_y)
    end

    def draw
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    	glEnable(GL_COLOR_MATERIAL)
    	glEnable(GL_DEPTH_TEST)
    	glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
    	glShadeModel(GL_SMOOTH)

      Camera.apply(width, height)

      EditorScene.draw

      @model.draw
    end

    def button_down(id)
      case id
      when Gosu::KbEscape
        close
      end
      Mouse.button_down(id, mouse_x, mouse_y)
    end

    def button_up(id)
      Mouse.button_up(id, mouse_x, mouse_y)
    end

    def needs_cursor?
      true
    end
  end
end
