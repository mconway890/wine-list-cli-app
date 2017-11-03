class WineList::Wine
  attr_accessor :name, :price, :score, :vintage, :url

  def self.today
    puts "Today's Top 100 Wines:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Lewis Cabernet Sauvignon Napa Valley - 2013 - 95 - $90
      2. Domaine Serene Chardonnay Dundee Hills Evenstad Reserve - 2014	- 95 - $55
    DOC

    wine_1 = self.new
    wine_1.name = "Lewis Cabernet Sauvignon Napa Valley"
    wine_1.price = "$90"
    wine_1.score = "95"
    wine_1.vintage = "2013"
    wine_1.url = "http://top100.winespectator.com/lists/"

    wine_2 = self.new
    wine_2.name = "Domaine Serene Chardonnay Dundee Hills Evenstad Reserve"
    wine_2.price = "$55"
    wine_2.rank = "95"
    wine_2.vintage = "2014"
    wine_2.url = "http://top100.winespectator.com/lists/"

    [wine_1, wine_2]
  end

end
