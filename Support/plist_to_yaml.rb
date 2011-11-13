ENV['GEM_PATH'] = ENV['TM_BUNDLE_SUPPORT'] + '/gems'

require 'rubygems'
require 'plist'
require 'yaml'

source_path = ENV['TM_FILEPATH']
puts Plist.parse_xml(source_path).to_yaml
