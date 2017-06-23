require 'nokogiri'
require 'open-uri'

def parse_section(as)
  for a in as do
    if a.text == ''
      puts "blank"
    else
      puts a.text
    end
  end
end


print 'Select a song to search: '
query = gets
query_endpoint = query.gsub(' ', '+')
search_endpoint = 'http://www.whosampled.com/search/?q=' + query_endpoint
query_page = Nokogiri::HTML(open(search_endpoint))

# Get link
node = query_page.root

route = ''
for i in node.css('div') do
  i.css('a.trackTitle').to_a.each do |item|
    route = item['href']
  end
end

link = 'http://www.whosampled.com' + route
page = Nokogiri::HTML(open(link))

def parse_contains(section)
  result = []
  section.css('a.trackName.playIcon').each_with_index do |item, index|
    author = section.css('span.trackArtist')[index].text
    song = item.text
    result.push([song, author])
  end
  result.each do |pair|
    output = '%s by %s' % [pair[0], pair[1]]
    puts output[0...-2]
  end
  puts ''
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

