require 'net/http'

# WebサーバーからHTMLを取得する処理
def get_from(url)
  Net::HTTP.get(URI(url))
end

# 取得したHTMLをファイルに保存する処理
def write_file(path, text)
  # file = File.open(path, 'w')
  # file.write(text)
  # file.close
  File.open(path, 'w') { |file| file.write(text) }
end

get_from('https://masayuki14.github.io/pit-news/')

require 'nokogiri'

html = File.open('pitnews.html', 'r') { |f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
# nodes = doc.xpath('//h6')
section = doc.xpath('/html/body/main/section[2]').first
# category = section.xpath('./h6').first.text

contents = {category: nil, news: []}
contents[:category] = section.xpath('./h6').first.text

section.xpath('./div/div').each do |node|
  title = node.xpath('./p/strong/a').first.text
  url = node.xpath('./p/strong/a').first['href']
  news = {title: title, url: url}
  contents[:news] << news
end

pp contents