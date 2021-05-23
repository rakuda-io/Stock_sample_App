require 'net/http'

# url = 'https://masayuki14.github.io/pit-news/'
# uri = URI(url)

# html = Net::HTTP.get(uri)

# file = File.open('pitnews.html', 'w')
# file.write(html)
# file.close

def get_from(url)
  Net::HTTP.get(URI(url))
end

def write_file(path, text)
  File.open(path, 'w') { |file| file.write(text)}
end

html = get_from('https://finviz.com/quote.ashx?t=ko')
write_file('coca-cola.html', html)