def item_xml(options = {})
  <<-ITEM
  <item arg="#{options[:arg]}" uid="#{options[:uid]}">
    <title>#{options[:title]}</title>
    <subtitle>#{options[:subtitle]}</subtitle>
    <icon>#{options[:path]}</icon>
  </item>
  ITEM
end

def match?(word, query)
  word.match(/#{query.gsub(/\\ /, '').split('').join('.*')}/i)
end

query = Regexp.escape(ARGV.first).delete(':')

images_folders = [
  '/users/xin/pictures/goddess',
  '/users/xin/pictures/expressions'
]

images_path = images_folders.inject([]) do |paths, folder|
  paths += Dir["#{folder}/**/*.jpg", "#{folder}/**/*.png"].keep_if do |path|
    name = File.basename(path, '.*')
    match?(name, query)
  end
end

items = images_path.uniq.sort.map do |path|
  basename = File.basename(path)
  item_xml({
    arg: path,
    uid: basename,
    path: path,
    title: basename,
    subtitle: "Copy #{basename} to clipboard"
  })
end.join

output = "<?xml version='1.0'?>\n<items>\n#{items}</items>"

puts output
