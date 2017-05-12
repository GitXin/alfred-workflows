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
  puts "<?xml version='1.0'?>\n<items>\n#{items}</items>"
  exit
end

def match?(word, query)
  word.match(/#{query.gsub(/\\ /, '').split('').join('.*')}/i)
end

query = Regexp.escape(ARGV.first)

paths = if File.exists? 'paths'
  File.read('paths').split("\n")
else
  []
end

if paths.size == 0
  output(item_xml({
    title: 'face-add example-fodlers-or-images',
    subtitle: 'Please add image paths for searching'
  }))
end

files = paths.inject([]) do |files, path|
  if File.file? path
    files << path
  else
    files += Dir["#{path}/**/*.jpg", "#{path}/**/*.jpeg", "#{path}/**/*.png", "#{path}/**/*.gif"]
  end
end

files.keep_if { |file| match?(File.basename(file), query) }

items = files.uniq.sort.map do |file|
  basename = File.basename(file)
  item_xml({
    arg: file,
    uid: basename,
    icon: file,
    title: basename,
    subtitle: file
  })
end.join

output(items)
