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


page = Nokogiri::HTML(File.open("html/father-stretch.html"))
# Sampled in

for i in page.css('section') do
  if i.css('header').css('span').text.match(/^Contains/) or i.css('header').css('span').text.match(/^Was/) then
    text = i.css('header').css('span').text
    if text.match(/^Contains/) then
      puts 'Contains: '
      for j in i.css('a.trackName.playIcon') do
        puts j.text
      end
    end
    if text.match(/^Was/) then
      puts 'Was sampled: '
      for j in i.css('a.trackName.playIcon') do
        puts j.text
      end
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
