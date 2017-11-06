require 'httparty'
require 'nokogiri'

uri = "http://finance.naver.com/sise/"

# uri 정보를 가져옴 
response = HTTParty.get(uri)

# 검색이 용이 하도록 만듬
text = Nokogiri::HTML(response.body)
# Nokogiri::XML => xml parshing 

puts "### Search for nodes by css"

# selector 를 기준으로 요소 검색 
kospi = text.css('#KOSPI_now')

# .text 를 태그 안에 글자만 가져옴 
puts kospi.text

