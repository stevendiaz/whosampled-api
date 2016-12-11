require 'nokogiri'

def parse_section(section)
    a_tags = section.css('a')
    # songs are in an array separated by blanks 
    # the first entry after the blank will be the song name
    # the following entries will be artists
    result_json = []
    counter = 0
    for a_tag in a_tags do
        if a_tag.text == ''
            # add list to result json
            # reset counter
            counter = 0
        else if counter == 0
            # create new dict
            song = a_tag.text
        else
            artist = a_tag.text
    end
    return a_tags.length
end

if __FILE__ == $0
    puts 'Hello...'
    html_doc = Nokogiri::HTML(File.open("html/3500-section.html"))
    puts parse_section(html_doc)
    as = html_doc.css('a')
    for a in as do
        if a.text == '' 
            puts "blankerino"
        else 
            puts a.text 
        end
    end
end
    
