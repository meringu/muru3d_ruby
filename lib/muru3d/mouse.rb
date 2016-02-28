module Muru3d
  class Mouse
    class << self
      def update(mouse_x, mouse_y)
        @delta_tilt = 0
        @delta_rotation = 0
        unless @mouse_x.nil?
          Camera.rotate(mouse_x - @mouse_x)
          Camera.tilt(mouse_y - @mouse_y)
          @mouse_x = mouse_x
          @mouse_y = mouse_y
        end
      end

      def button_down(id, mouse_x, mouse_y)
        case id
        when Gosu::MsMiddle
          @mouse_x = mouse_x
          @mouse_y = mouse_y
        when Gosu::MsWheelDown

        when Gosu::MsWheelUp

        end
      end

      def button_up(id, mouse_x, mouse_y)
        case id
        when Gosu::MsMiddle
          @mouse_x = nil
          @mouse_y = nil
        end
      end
    end
  end
end
