require "./spec_helper"
require "text"

describe Soundx do
  describe "#encode" do
    it "returns the correct code for 'johnny'" do
      Soundx.encode("johnny").should eq "J500"
    end

    it "returns the correct code for 'Schwarzenegger'" do
      Soundx.encode("Schwarzenegger").should eq "S262"
    end

    it "returns the correct code for 'Lukasiewicz'" do
      Soundx.encode("Lukasiewicz").should eq "L222"
    end

    it "returns the correct code for 'Tymczak'" do
      Soundx.encode("Tymczak").should eq "T522"
    end

    it "returns the correct code for 'rupert'" do
      Soundx.encode("rupert").should eq "R163"
    end
  end
end

