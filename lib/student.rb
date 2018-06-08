class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    # Scraper.scrape_index_page(index_url)
    students_array.each do |student_info|
      student = Student.new(student_info)
      student_info.each {|key, value| student.send(("#{key}="), value)}
      @@all << student
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each {|k,v| self.send(("#{k}="), v)}


  end

  def self.all
    @@all
  end
end
