def item_xml(options = {})
  <<-ITEM
  <item arg="#{options[:arg]}" uid="#{options[:uid]}">
    <title>#{options[:title]}</title>
    <subtitle>#{options[:subtitle]}</subtitle>
    <icon>#{options[:path]}</icon>
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
paths = File.read('paths').split("\n")

if paths.size == 0
  output(item_xml({
    arg: nil,
    uid: nil,
    title: 'Please add image paths for searching',
    subtitle: 'there aren\'t paths to search expressions, please use the add command',
    path: nil
  }))
end

files = paths.inject([]) do |files, path|
  if File.file? path
    files << path
  else
    files += Dir["#{path}/**/*.jpg", "#{path}/**/*.png"]
  end
end

files.keep_if do |file|
  name = File.basename(file, '.*')
  match?(name, query)
end

items = files.uniq.sort.map do |file|
  basename = File.basename(file)
  item_xml({
    arg: file,
    uid: basename,
    path: file,
    title: basename,
    subtitle: file
  })
end.join

output(items)
