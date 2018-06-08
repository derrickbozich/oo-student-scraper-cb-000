require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".student-card a").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = "#{student.attr('href')}"
      student_array.push({:name => name, :location => location, :profile_url => profile_url})
    end
    student_array

  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    profile_quote = doc.css(".profile-quote").text
    bio = doc.css(".description-holder p").text
    links = doc.css(".social-icon-container a")
    link_array = []
    links.each do |link|
      link_array.push("#{link.attr('href')}")
    end

    attributes = {}

    link_array.each do |link|
      if link.include?("twitter")
        attributes[:twitter]=link
      elsif link.include?("linkedin")
        attributes[:linkedin]=link
      elsif link.include?("github")
        attributes[:github]=link
      elsif link
        attributes[:blog]=link
      end
    end

    attributes[:profile_quote]=profile_quote
    attributes[:bio]=bio

    attributes
  end
end
