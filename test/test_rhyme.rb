require File.dirname(__FILE__) + '/../lib/rhyme'

require "date"
require "java"

describe Rhyme do
  
  it "should translate a Map" do
    Rhyme.translate(java.util.HashMap.new).class.should eql(Hash.new.class)
  end
  
  it "should translates map values" do
    jmap = java.util.HashMap.new
    jmap.put "key1", "value"
    jmap.put "key2", java.util.Date.new(1234567890)
    rmap = Rhyme.translate(jmap)
    rmap["key1"].should eql("value")
    rmap["key2"].to_s.should eql("2009-02-13")
  end
  
  it "should translate a Date" do
    Rhyme.translate(java.util.Date.new(1234567890)).to_s.should eql("2009-02-13")
  end
  
  it "should translate an ArrayList" do
  	Rhyme.translate(java.util.ArrayList.new).class.should eql(Array.new.class)
  end
  
end