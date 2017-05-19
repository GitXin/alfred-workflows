def item_xml(options = {})
  <<-ITEM
  <item arg="#{options[:arg]}" uid="#{options[:uid]}">
    <title>#{options[:title]}</title>
    <subtitle>#{options[:subtitle]}</subtitle>
    <icon>#{options[:icon]}</icon>
  </item>
  ITEM
end

def output(items)
  items = [items] unless items.is_a?(Array)
  items = items.map {|item| item_xml(item)}.join
  puts "<?xml version='1.0'?>\n<items>\n#{items}</items>"
  exit
end

def match?(word, query)
  word.match(/#{query.gsub(/\\ /, '').split('').join('.*')}/i)
end
