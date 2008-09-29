require File.dirname(__FILE__) + '/../lib/rhyme'

require "date"
require "java"

describe Rhyme do
  
  it "should translate a Map" do
    Rhyme.translate(java.util.HashMap.new).class.should eql(Hash.new.class)
  end
  
  it "should translate a Hash" do
    Rhyme.translate(Hash.new).class.should eql(java.util.HashMap.new.class)
  end
  
  it "should translates map values" do
    jmap = java.util.HashMap.new
    jmap.put "key1", "value"
    jmap.put "key2", java.util.Date.new(1234567890)
    rmap = Rhyme.translate(jmap)
    rmap["key1"].should eql("value")
    rmap["key2"].to_s.should eql("1970-01-15")
  end
  
  it "should translates hash values" do
    rmap = Hash.new
    rmap["key1"] = "value"
    rmap["key2"] = Date.new(2009, 2, 13)
    jmap = Rhyme.translate(rmap)
    jmap.get("key1").should eql("value")
    jmap.get("key2").to_string.should eql("Fri Feb 13 00:00:00 BRST 2009")
  end
  
  it "should translate a Java Date value" do
    Rhyme.translate(java.util.Date.new(1234567890)).to_s.should eql("1970-01-15")
  end
  
  it "should translate a Java Date" do
    Rhyme.translate(java.util.Date.new(1234567890)).class.should eql(Date.new.class)
  end
  
  it "should translate a Ruby Date value" do
    Rhyme.translate(Date.new(2009, 2, 13)).to_s.should eql("Fri Feb 13 00:00:00 BRST 2009")
  end
  
  it "should translate a Ruby Date" do
    Rhyme.translate(Date.new(2009, 2, 13)).class.should eql(java.util.Date.new(1234567890).class)
  end
  
  it "should translate an ArrayList" do
  	Rhyme.translate(java.util.ArrayList.new).class.should eql(Array.new.class)
  end
  
  it "should translate an ArrayList values" do
    array = java.util.ArrayList.new
    array.add java.util.HashMap.new
  	Rhyme.translate(array)[0].class.should eql(Hash.new.class)
  end
  
  it "should translate an Array" do
  	Rhyme.translate(Array.new).class.should eql(java.util.ArrayList.new.class)
  end
  
  it "should translate an Array values" do
  	Rhyme.translate([{}])[0].class.should eql(java.util.HashMap.new.class)
  end
  
end