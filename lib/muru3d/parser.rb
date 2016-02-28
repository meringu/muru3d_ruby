module Muru3d
  module Parser
    def self.open_file(file_name)
      Obj.new(File.open(file_name).read).model
    end
  end
end
