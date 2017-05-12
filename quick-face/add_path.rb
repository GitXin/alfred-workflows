path = ARGV.first

if File.file? path
  extension = File.extname(path)
  exit unless ['.jpg', '.jpeg', '.png', '.gif'].include? extension
end

open('paths', 'a') { |f|
  f.puts "#{path}\n"
}
