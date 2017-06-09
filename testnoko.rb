require 'nokogiri'


def parse_section(as)
  for a in as do
    if a.text == ''
      puts "blank"
    else
      puts a.text
    end
  end
end

page = Nokogiri::HTML(File.open("html/paris.html"))
# Sampled in

def parse_contains(section)
  result = []
  section.css('a.trackName.playIcon').each_with_index do |item, index|
    author = section.css('span.trackArtist')[index].text
    song = item.text
    result.push([song, author])
  end
  result.each do |pair|
    puts '%s by %s' % [pair[0], pair[1]]
  end
end

for i in page.css('section') do
  if i.css('header').css('span').text.match(/^Contains/) or i.css('header').css('span').text.match(/^Was/) then
    text = i.css('header').css('span').text
    if text.match(/^Contains/) then
      puts 'Contains: '
      parse_contains(i)
    end

    if text.match(/^Was/) then
      puts 'Was sampled: '
      parse_contains(i)
    end
  end
end

#for i in page.css('a.trackName.playIcon') do
#  puts i.text
#end

#for i in page.css('span.trackArtist').css('a') do
#  puts i.text
#end
#puts page.css('a.trackName.playIcon').text
#parse_section(page.css('a'))
