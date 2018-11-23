class WineList::Wine
  attr_accessor :name, :rating_price, :description, :url

  def self.today
    #Scrape Wine Spectator then return wines based on that data
    self.scrape_wines
  end

  def self.year
    self.scrape_year
  end

  def self.scrape_wines
    wines = []

    wines << self.scrape_1
    wines << self.scrape_2
    wines << self.scrape_3

    wines
  end

  def self.scrape_year
    wines = []

    wines << self.scrape

    wines
  end

  def self.scrape_1
    doc = Nokogiri::HTML(open("https://www.winespectator.com/dailypicks/category/catid/1"))
    wine = self.new
    wine.name = doc.search("div.daily-wine-items h5 a").first.text
    wine.rating_price = doc.search("div.daily-wine-items h6").first.text
    wine.description = doc.search("div.daily-wine-items div.paragraph").first.text.strip
    wine.url = doc.search("div.daily-wine-items h5 a").first.attr("href")
    wine
  end

  def self.scrape_2
    doc = Nokogiri::HTML(open("https://www.winespectator.com/dailypicks/category/catid/2"))
    wine = self.new
    wine.name = doc.search("div.daily-wine-items h5 a").first.text
    wine.rating_price = doc.search("div.daily-wine-items h6").first.text
    wine.description = doc.search("div.daily-wine-items div.paragraph").first.text.strip
    wine.url = doc.search("div.daily-wine-items h5 a").first.attr("href")
    wine
  end

  def self.scrape_3
    doc = Nokogiri::HTML(open("https://www.winespectator.com/dailypicks/category/catid/3"))
    wine = self.new
    wine.name = doc.search("div.daily-wine-items h5 a").first.text
    wine.rating_price = doc.search("div.daily-wine-items h6").first.text
    wine.description = doc.search("div.daily-wine-items div.paragraph").first.text.strip
    wine.url = doc.search("div.daily-wine-items h5 a").first.attr("href")
    wine
  end

  def self.scrape
    doc = Nokogiri::HTML(open("https://www.totalwine.com/top-20-wines-of-2017"))

    doc.search("div.ranking section.text").collect do |section|
      wine = self.new
      wine.name = section.search("h4").text.split[1..-1].join(" ")
      wine.description = section.search("p").text
      wine
    end

  end


end
