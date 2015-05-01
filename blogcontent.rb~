require 'selenium-webdriver'
require 'json'

driver = Selenium::WebDriver.for :firefox

file = File.read('url_posts.json')
url_posts = JSON.parse(file)

content_posts = []
url_posts['url_posts'].each do |url|
	driver.navigate.to url
	title = driver.find_element(:css, ".post-title").text
	content = driver.find_elements(:css, '.col-md-8 p').collect{|p| p.text}.join('\n')
	content_posts << {
										:title => title, 
										:text => content
									 }
end

posts = {:posts => content_posts}

File.open("posts.json","w") do |f|
  f.write(posts.to_json)
end

driver.quit
