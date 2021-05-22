require 'nokogiri'

html = File.open('finviz.html', 'r') { |f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

nodes = doc.xpath('//td')
nodes.each { |node| pp node }