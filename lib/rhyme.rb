require "date"

module Rhyme
  
  def self.translate(x)
    case x.class.to_s
      when "Java::JavaUtil::HashMap" then self.translate_map(x)
      when "Java::JavaUtil::Date" then self.translate_date(x)
      else x
    end
  end
  
  def self.translate_map(map)
    hash = Hash.new
    map.key_set.each { |key| hash[key] = translate(map.get(key)) }
    return hash
  end
  
  def self.translate_date(javaDate)
    Date.parse(Time.at(javaDate.getTime).strftime('%Y/%m/%d'))
  end
  
end