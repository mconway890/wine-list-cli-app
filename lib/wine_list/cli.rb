# Our CLI Controller
class WineList::CLI

  def call
    list_wines
    menu
    goodbye
  end

  def list_wines
    puts "Today's Top 100 Wines:"
    @wines = WineList::Wine.today
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name} - #{wine.rating} - #{wine.origin} - #{wine.price} - #{wine.rank}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the wine you'd like more info on or type list to see the wines again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_wine = @wines[input.to_i - 1]
        puts "#{the_wine.name} - #{the_wine.rating} - #{the_wine.origin} - #{the_wine.price} - #{the_wine.rank}"
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
