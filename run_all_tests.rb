Dir.entries('.').each { |file| require "./#{file[0...-3]}" if file =~ /_test.rb$/ }
