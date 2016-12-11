require 'nokogiri'


if __FILE__ == $0
    puts 'Hello...'
    html_doc = Nokogiri::HTML(File.open("html/3500-section.html"))
    #spans = html_doc.css('span')
    #for span in spans do
    #    puts span.text
    #end 
    as = html_doc.css('a')
    for a in as do
        if a.text == '' 
            puts "blankerino"
        else 
            puts a.text 
        end
    end
end
    
