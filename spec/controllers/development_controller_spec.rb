require 'spec_helper'

describe DevelopmentController do

  describe "GET 'debug'" do
    it "returns http success" do
      get 'debug'
      response.should be_success
    end
  end

end
