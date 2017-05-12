path = ARGV.first

if File.file? path
  extension = File.extname(path)
  exit unless ['.jpg', '.png'].include? extension
end

open('paths', 'a') { |f|
  f.puts "#{path}\n"
}
