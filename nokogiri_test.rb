require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


html = Nokogiri::HTML(open("http://www.viovet.co.uk/Pet_Foods_Diets-Dogs-Hills_Pet_Nutrition-%20Hills_Prescription_Diets/c233_234_2678_93/category.html"))

html.xpath('//a[@class="product-content-box panel"]/@href').each do |node|
       #puts "http://www.viovet.co.uk#{node.text}"
       url = "http://www.viovet.co.uk#{node.text}"
       puts url

       products = Nokogiri::HTML(open("#{url}"))
       products.xpath('//h1').each do |title|
       		puts title.text
       end

    end


#html.xpath('//div[@class="gridbox one-quarter"]').each do |node|
#		url = html.xpath('//a[@class="product-content-box panel"]/@href')
#		real_url = "http://www.viovet.co.uk#{url}"
#		#puts "#{real_url}"
#		puts real_url.size
#		puts real_url
#   end
    

#html.css(".gridbox .one-quarter").each do |item|
#	puts item.inner_html, "\n\n"
#	puts item.at_css(".gridbox .one-quarter")[:href]
#end

#puts html.css(".product-content-box")[3].text

