# Our CLI Controller
class WineList::CLI

  def call
    list_wines
    menu
    goodbye
  end

  def list_wines
    puts " ---------- Welcome to Wine List ----------"
    puts ""
    puts "Today's Top Wines:"
    puts ""
    @wines = WineList::Wine.today
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name} - #{wine.rating_price}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the wine you'd like more info on, type list to see the wines again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_wine = @wines[input.to_i - 1]
        puts ""
        puts "#{the_wine.name} - #{the_wine.rating_price}"
        puts ""
        puts "#{the_wine.description}"
      elsif input == "list"
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
