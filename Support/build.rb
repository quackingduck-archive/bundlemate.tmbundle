require 'plist'

source_file = ENV['TM_FILEPATH']
bundle_dir  = File.dirname(source_file)

targets = YAML.load(File.read(source_file))

targets.each do |filename, data|
  File.open(bundle_dir + '/' + filename, 'w') do |f|
    f.write data.to_plist
  end
end

puts "Finished building bundle"