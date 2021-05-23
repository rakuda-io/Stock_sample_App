require 'net/http'
require 'nokogiri'

html = File.open('coca-cola.html', 'r') { |f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

section = doc.xpath('//*[@id="ticker"]').text

# contents = {category: nil, news: []}
# contents[:category] = section.xpath('./h6').first.text

# section.xpath('./div/div').each do |node|
#   title = node.xpath('./p/strong/a').first.text
#   url = node.xpath('./p/strong/a').first['href']
#   news = {title: title, url: url}
#   contents[:news] << news
# end

# pp contents
pp section