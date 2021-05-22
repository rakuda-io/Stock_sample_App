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

html = get_from('https://finviz.com/quote.ashx?t=ko')

write_file('finviz.html', html)