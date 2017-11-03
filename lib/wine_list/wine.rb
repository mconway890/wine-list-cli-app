class WineList::Wine
  attr_accessor :name, :rating, :origin, :price, :rank, :url

  def self.today
    #Scrape Wine Spectator then return wines based on that data
    self.scrape_wines
  end

  def self.scrape_wines
    wines = []

    wines << self.scrape_enthusiast

    wines
  end

  def self.scrape_enthusiast
    doc = Nokogiri::HTML(open("http://www.winemag.com/toplists/bestbuys2017/"))

    wine = self.new
    wine.name = title = doc.search("div.title").text
    wine.rating = doc.search("span.rating").text
    wine.origin = doc.search("span.appellation").text
    wine.price = doc.search("span.price").text
    wine.rank = doc.search("div.review-ranking").text
    wine.url = doc.search("a.review-listing").first.attr("href")
    wine
  end
end
