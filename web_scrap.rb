#when on a mac
#make sure you gem install 'HTTParty'
#make sure you gem install 'Nokogiri'
#make sure you gem install 'Pry'
#make sure you gem install 'csv'

#To run this application ruby web_scrap.rb


#Thought process
#We are given an HTML page and we need to scrape for the data given
#Below I decided to use Ruby because it is very friendly for scraping data.

#httparty also includes the executable httparty which can be used to query web services
# and examine the resulting output. 
#HTTParty to send a GET request to the page we’re interested in scraping
require 'HTTParty'
#Nokogiri is parser #is an HTML, XML, SAX, and Reader parser
require 'Nokogiri'

#Pry is a ruby gem that stops the ruby program for debugging and see what we are getting
require 'Pry'
#This is too extract to a csv file.
require 'csv'

#this is how we request the page 
page = HTTParty.get("https://www.google.ca/?gws_rd=ssl#q=raptors+scores")

#this is where you transform our http request into a nokogiri object
parse_page = Nokogiri::HTML(page)

Pry.start(binding)
#This is an array that holds all the Raptors contents for now also might convert it into a dictionary
raptors_array = []

#this will convert it to string and push it to an array
parse_page.css('.crt-p').map do |a|
	#no value yet because I need to find the elements by drilling deeper, the class for storing the name is vk_h
	post_name = a.text
	raptors_array.push(post_name)
end


#Future feature this will convert it into a csv file, and maybe push it mobile application or an offline application