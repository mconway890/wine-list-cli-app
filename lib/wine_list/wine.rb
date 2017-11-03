class WineList::Wine
  attr_accessor :name, :price, :score, :vintage, :url

  def self.today
    #Scrape Wine Spectator then return wines based on that data
    self.scrape_wines
  end

  def self.scrape_wines
    wines = []

    wines << self.scrape_spectator

    wines
  end

  def self.scrape_spectator
    doc = Nokogiri::HTML(open("http://top100.winespectator.com/lists/"))
    binding.pry
  end
end
