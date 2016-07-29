def parse_table_name(name)
  words = name.split('_')
  words.each { |w| w.capitalize! }
  words.join(" ")
end