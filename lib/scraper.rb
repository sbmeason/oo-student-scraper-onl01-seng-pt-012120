require 'Nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = open("https://learn-co-curriculum.github.io/student-scraper-test-page/")
    index = Nokogiri::HMTL(html)
    index.css("div.roster-cards-container").each do |student|
    student.css(".student-card a").each do |details|
    student_details = {}
      student_details[:name] = details.css(".student-name").text 
      student_details[:location] = details.css(".student-location").text
      student_details[:profile_url] = details.attr("href")
      students << student_details
    end
  
end

