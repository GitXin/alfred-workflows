def item_xml(options = {})
  arg = options[:arg] || options[:title]
  arg = arg.join(';') if arg.is_a? Array
  <<-ITEM
  <item arg="#{arg}" uid="#{options[:uid]}">
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
