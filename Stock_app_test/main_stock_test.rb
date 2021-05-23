require 'net/http'
require 'nokogiri'
require 'open-uri'

ticker_symbol = gets

url = "https://finviz.com/quote.ashx?t=#{ticker_symbol}"
html = URI.open(url)

doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

ticker = doc.xpath('//*[@id="ticker"]').text
cp_name = doc.xpath('/html/body/div[4]/div/table[1]//b').text
dividend = doc.xpath('//td[@class="snapshot-td2"]/b')[36].text
dividend_per = doc.xpath('//td[@class="snapshot-td2"]/b')[42].text

puts ticker, cp_name, dividend, dividend_per, url