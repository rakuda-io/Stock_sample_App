require 'net/http'
require 'nokogiri'

html = File.open('coca-cola.html', 'r') { |f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

ticker = doc.xpath('//*[@id="ticker"]').text
cp_name = doc.xpath('/html/body/div[4]/div/table[1]//b').text
dividend = doc.xpath('//td[@class="snapshot-td2"]/b')[36].text
dividend_per = doc.xpath('//td[@class="snapshot-td2"]/b')[42].text

# /html/body/div[4]/div/table[1]/tbody/tr/td/table[1]/tbody/tr[2]/td/a/b
# contents = {category: nil, news: []}
# contents[:category] = section.xpath('./h6').first.text

# section.xpath('./div/div').each do |node|
#   title = node.xpath('./p/strong/a').first.text
#   url = node.xpath('./p/strong/a').first['href']
#   news = {title: title, url: url}
#   contents[:news] << news
# end

# pp contents
puts ticker, cp_name, dividend, dividend_per
puts