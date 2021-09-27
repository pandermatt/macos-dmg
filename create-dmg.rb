require 'highline/import'

unless system('which create-dmg > /dev/null')
  puts '"create-dmg" is not installed'
  exit false unless HighLine.agree('Install it now?')
  puts 'Installing...'
  system('brew install create-dmg')
end

puts '>> Enter dmg Name'
name = gets.chomp



system(%(create-dmg \
--volname "#{name} Installer" \
--volicon "#{name}.icns" \
--background "#{name}.png" \
--window-pos 200 120 \
--window-size 800 400 \
--icon-size 100 \
--icon "Application.app" 200 190 \
--hide-extension "Application.app" \
--app-drop-link 100 100 \
"#{name}-Installer.dmg" \
"source/"))
