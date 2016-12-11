require 'nokogiri'


if __FILE__ == $0
    puts 'Hello...'
    doc = File.open("html/father-stretch.html") { |f| Nokogiri::HTML(f) }
    html_doc = Nokogiri::HTML(File.open("html/father-stretch.html"))
    artists = html_doc.css('section')
    puts artists.text
end
    
