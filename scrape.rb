require 'net/http'

url = 'https://finviz.com/quote.ashx?t=ko'
uri = URI(url)

html = Net::HTTP.get(uri)

file = File.open('finviz.html', 'w')
file.write(html)
file.close