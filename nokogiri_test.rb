require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


html = Nokogiri::HTML(open("http://www.viovet.co.uk/Pet_Foods_Diets-Dogs-Hills_Pet_Nutrition-%20Hills_Prescription_Diets/c233_234_2678_93/category.html"))

html.xpath('//a[@class="product-content-box panel"]/@href').each do |node|

       url = "http://www.viovet.co.uk#{node.text}"
       puts url

       products = Nokogiri::HTML(open("#{url}"))
       		products.xpath('//li[@itemprop="offers"]').each do |node|
       			section_html = Nokogiri::HTML(node.inner_html)
       			title = section_html.xpath('//div[@class="title"]').text
       			price = section_html.xpath('//span[@itemprop="price"]').text
       			sku = section_html.xpath('//strong[@itemprop="sku"]').text
       			dispatch = section_html.xpath('//strong[@class="stock in-stock"]').text

       			puts title
       			puts price
       			puts sku
       			puts dispatch
       			puts "\n\n\n"

       			
       			#title = product_info.xpath('//div[@class="title"]').text
       			#price = product_info.xpath('//span[@itemprop="price"]').text
       			#puts title
       			#puts price
       end


#       products.xpath('//div[@class="title"]').each do |title|
 #      		title = title.text
  #     		puts title		
   #    end
#
 #      products.xpath('//span[@itemprop="price"]').each do |price|
  #     		price = price.text
   #    		puts price
    #   end
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

