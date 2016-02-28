require 'spec_helper'

describe Muru3d do
  describe Muru3d::Parser do
    describe Muru3d::Parser::Obj do
      let(:box_file) { 'spec/fixtures/models/box.obj' }

      subject { described_class.new(File.open(box_file).read) }

      describe '#model' do
        it 'gets the model' do
          expect(subject.model).to be_a(Muru3d::Model)
        end
      end
    end
  end
end
