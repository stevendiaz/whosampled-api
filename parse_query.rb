require 'nokogiri'

page = Nokogiri::HTML(File.open("html/query_mywayhome.html"))

def parse_contains(section)

end

"""
for i in page.css('id').css('main').css('id').css('class').css('class') do
  puts i
end

for i in page.css('body').css('div').css('main').css('div').css('div') do
  puts i.text
end
"""

# Create node object
node = page.root
puts node.html?

for i in node.css('div') do
  i.css('a.trackTitle').to_a.each do |item|
    puts item['href']
  end
end

for i in page.css('class.divided-layout') do
  puts ''
  puts i.text
  #if i.text == 'divided-layout'
  #  puts 'found'
  #end

  #if i.css('class').text.match("topHit")
  #  puts 'found'
  #end
end
