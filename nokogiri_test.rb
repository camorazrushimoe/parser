require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


html = Nokogiri::HTML(open("http://www.viovet.co.uk/Pet_Foods_Diets-Dogs-Hills_Pet_Nutrition-%20Hills_Prescription_Diets/c233_234_2678_93/category.html"))

html.xpath('//a[@class="product-content-box panel"]/@href').each do |node|

       url = "http://www.viovet.co.uk#{node.text}"
       puts url

       products = Nokogiri::HTML(open("#{url}"))

       img = products.xpath('//a[@class="fancybox-thumb"]/img/@src')


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
       				if 
       					title != nil
       					puts "http:#{img}"
       				else
       				end
       			puts "\n\n\n"

       end
    end

