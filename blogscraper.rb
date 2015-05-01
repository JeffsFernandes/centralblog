require 'selenium-webdriver'
require 'json'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://www.central3.com.br/blog/"
url_posts = []

#puts driver.find_elements(:css, ".box_post_lista .titulo_post a[href]").each{|e| puts e.text} #gets post title
driver.find_elements(:css, ".box_post_lista .titulo_post a").each{|e| url_posts << e.attribute('href')}

posts = {:url_posts => url_posts}

File.open("url_posts.json","w") do |f|
  f.write(posts.to_json)
end

driver.quit
