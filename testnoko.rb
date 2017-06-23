require 'nokogiri'
require 'open-uri'
WHOSAMPLED_BASE = 'http://www.whosampled.com'

def get_query_endpoint()
  print 'Select a song to search: '
  query = gets
  query_endpoint = query.gsub(' ', '+')
  search_endpoint = WHOSAMPLED_BASE + '/search/?q=' + query_endpoint
end

def get_samples_endpoint(search_endpoint)
  page = Nokogiri::HTML(open(search_endpoint))
  node = page.root
  route = ''
  node.css('div').each do |i|
    i.css('a.trackTitle').to_a.each do |item|
      route = item['href']
    end
  end
  WHOSAMPLED_BASE + route
end

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

def parse_samples(samples_endpoint)
  page = Nokogiri::HTML(open(samples_endpoint))
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
end

def retry_prompt()
  print 'Would you like to keep searching? (Y/N):'
  answer = gets
  answer.chomp.downcase == 'y'
end

continue = true
while continue do
  query = get_query_endpoint()
  samples = get_samples_endpoint(query)
  parse_samples(samples)
  continue = retry_prompt()
end

