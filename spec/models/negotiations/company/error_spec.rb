require 'spec_helper'

describe Negotiations::Company::Error do
  let(:api) { Negotiations::Company::Error }
  context "sanity" do
    it "should have the correct superclass of generic error" do
      api.superclass.should eq ::Models::GenericError
    end
    it "should have an abstract class-level method called model which must be implemented by classes that inherit this one" do
      expect { ::Models::GenericError.model }.to raise_error(NotImplementedError)
    end
  end
  describe "::from_404" do
    before :each do
      @id = 1341
    end
    let(:error) { api.from_404 @id }
    it "should generate a proper error object for the company" do
      error.should be_a api
    end
    it "should contain the correct error text" do
      error.errors.should_not be_empty
    end
    it "should be shit because it's an error" do
      error.should be_shit
    end
    describe "#method_missing" do
      it "should just record all the methods that get called on this error object" do
        expect { error.lolcat(234) }.to change(error.errors, :count).by 1
      end
    end
  end
end