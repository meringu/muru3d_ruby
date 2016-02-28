module Muru3d
  class Camera
    class << self
      include GL

      attr_accessor :fov
      attr_accessor :target
      attr_accessor :z_far
      attr_accessor :z_near
      attr_accessor :zoom

      def initialize(opts = {})
        @fov = opts.fetch(:fov) { 20 }
        @target = opts.fetch(:target) { Geometry::Vector3.zero }
        @tilt = opts.fetch(:tilt) { 25 }
        @rotation = opts.fetch(:rotation) { 45 }
        @z_far = opts.fetch(:z_far) { 1000 }
        @z_near = opts.fetch(:z_near) { 1 }
        @zoom = opts.fetch(:zoom) { 10 }
      end

      def apply(width, height)
        glMatrixMode(GL_PROJECTION)
      	glLoadIdentity
      	gluPerspective(fov, width.to_f / height.to_f, z_near, z_far)
      	glMatrixMode(GL_MODELVIEW)
      	glLoadIdentity
        xpos = -zoom * Math.cos(@tilt*Math::PI/180) * Math.sin(@rotation*Math::PI/180) + target.x;
  	    ypos = zoom * Math.sin(@tilt*Math::PI/180) + target.y;
  	    zpos = zoom * Math.cos(@tilt*Math::PI/180) * Math.cos(@rotation*Math::PI/180) + target.z;
      	gluLookAt(xpos, ypos, zpos, target.x, target.y, target.z, 0, 1, 0)
      end

      def tilt(delta_tilt)
        @tilt += delta_tilt
  			@tilt = 85 if @tilt > 85
  			@tilt = -85 if @tilt < -85
      end

      def rotate(delta_rotation)
        @rotation += delta_rotation
      end
    end
  end
end
