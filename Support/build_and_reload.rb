require(ENV['TM_BUNDLE_SUPPORT'] + '/build')

puts "Bundles Reloaded" if system %(osascript -e 'tell app "TextMate" to reload bundles')