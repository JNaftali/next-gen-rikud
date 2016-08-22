class Link < ActiveRecord::Base

  def self.all_by_type
    result = Hash.new { |hash, key| hash[key] = Array.new }
    Link.all.each do |link|
      result[link.type] << link
    end
    p result
  end
  
end
