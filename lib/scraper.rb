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
<<<<<<< HEAD

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
=======

    # blog = nil
    #
    # twitter, linkedin, github = nil

    attributes = {}

    link_array.each do |link|
      if link.include?("twitter")
        # twitter = link
        attributes[:twitter]=link
      elsif link.include?("linkedin")
        # linkedin = link
        attributes[:linkedin]=link
      elsif link.include?("github")
        # github = link
        attributes[:github]=link
      elsif link
        # blog = link
        attributes[:blog]=link
      end
    end

    attributes[:profile_quote]=profile_quote
    attributes[:bio]=bio
    binding.pry
    attributes
    # individual_data = {:twitter => twitter, :linkedin => linkedin, :github => github, :blog => blog,
    # :profile_quote => profile_quote, :bio => bio}
  end
end


# class User
#   attr_accessor :name, :user_name, :age, :location, :bio
#
#   def initialize(attributes)
#     attributes.each {|key, value| self.send(("#{key}="), value)}
#   end
# end


# require 'open-uri'
# require 'nokogiri'
# profile_url = "./fixtures/student-site/students/eric-chu.html"
#
#
# doc = Nokogiri::HTML(open(profile_url))
# profile_quote = doc.css(".profile-quote").text
# bio = doc.css(".description-holder p").text
# links = doc.css(".social-icon-container a")
#
# array = []
# links.each do |link|
#   array.push("#{link.attr('href')}")
# end
# array
#
# link1 = "#{doc.css(.social-icon-container a)}"
>>>>>>> a72fb978cd583c98e34baa8e03b5cd560a5197ba
