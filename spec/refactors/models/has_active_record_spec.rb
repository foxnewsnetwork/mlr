require 'spec_helper'

describe Models::HasActiveRecord do
  let(:api) { Models::HasActiveRecord }

  context "default errors" do
    let(:lolcat) do
      Class.new do
        extend Models::HasActiveRecord
      end
    end
    describe "::_from_record" do
      it "should throw an implement me error" do
        expect { lolcat.send "_from_record", "asdf" }.to raise_error NotImplementedError
      end
    end
    ["error", "record"].each do |genre|
      describe "::_#{genre}_model" do
        before :each do
          @class = Class.new { extend Models::HasActiveRecord }
          @method = "_#{genre}_model"
        end
        it "should generate a sentence tell me no model was found" do
          expect { @class.send @method }.to raise_error NotImplementedError
        end
      end
    end
  end
end