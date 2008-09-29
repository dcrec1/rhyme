require "date"

module Rhyme
  
  def self.translate(x)
    case x.class.to_s
      when "Java::JavaUtil::HashMap" then self.translate_hash_map(x)
      when "Java::JavaUtil::Date" then self.translate_date(x)
      when "Java::JavaUtil::ArrayList" then self.translate_array_list(x)
      when "Hash" then self.translate_hash(x)
      when "Date" then self.translate_date(x)
      when "Array" then self.translate_array(x)
      else x
    end
  end
  
  def self.translate_hash_map(map)
    hash = Hash.new
    map.key_set.each { |key| hash[key] = translate(map.get(key)) }
    return hash
  end
  
  def self.translate_date(date)
    if date.class.to_s.eql? "Date"
      java.util.Date.new(Time.local(date.strftime("%Y"), date.strftime("%m"), date.strftime("%d")).to_i * 1000)
    else
      Date.parse(Time.at(date.getTime / 1000).strftime('%Y/%m/%d'))
    end
  end
  
  def self.translate_array_list(array_list)
  	array = Array.new
  	array_list.each { |x| array.push translate(x) }
  	return array
  end
  
  def self.translate_hash(hash)
    map = java.util.HashMap.new
    hash.each { |x| map.put x[0], translate(x[1]) }
    return map
  end
  
  def self.translate_array(array)
    array_list = java.util.ArrayList.new
    array.each { |x| array_list.add translate(x) }
    return array_list
  end
  
end