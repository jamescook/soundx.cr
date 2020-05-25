require "./spec_helper"
require "text"

describe Soundx do
  describe "#encode" do
    it "returns the correct code for 'Al'" do
      Soundx.encode("Al").should eq "A400"
    end

    it "returns the correct code for 'Pfister'" do
      Soundx.encode("Pfister").should eq "P236"
    end

    it "returns the correct code for 'jackson'" do
      Soundx.encode("jackson").should eq "J250"
    end

    it "returns the correct code for 'johnny'" do
      Soundx.encode("johnny").should eq "J500"
    end

    it "returns the correct code for 'Schwarzenegger'" do
      Soundx.encode("Schwarzenegger").should eq "S625"
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

    it "returns the correct code for 'Ashcraft'" do
      Soundx.encode("Ashcraft").should eq "A261"
    end

    it "returns the correct code for 'ashcroft'" do
      Soundx.encode("ashcroft").should eq "A261"
    end

    it "returns the correct code for 'Lloyd'" do
      Soundx.encode("Lloyd").should eq "L300"
    end
  end
end

