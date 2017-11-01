# Our CLI Controller
class WineList::CLI

  def call
    list_wines
    menu
    goodbye
  end

  def list_wines
    puts "Today's Top 100 Wines:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Lewis Cabernet Sauvignon Napa Valley - 2013 - 95 - $90
      2. Domaine Serene Chardonnay Dundee Hills Evenstad Reserve - 2014	- 95 - $55
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the wine you'd like more info on or type list to see the wines again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on deal 1..."
      when "2"
        puts "More info on deal 2..."
      when "list"
        list_wines
      else
        puts "Woops! Type list or exit or enter a valid number."
      end
    end
  end

  def goodbye
    puts "Thank's for coming!"
  end

end
