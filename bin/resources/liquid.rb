require "rubygems"

def has_to_liquid(x)
	x.methods.include? "to_liquid"
end