# Our CLI Controller
class WineList::CLI

  def call
    list_todays_wines
    menu
    goodbye
  end

  def list_todays_wines
    puts " ---------- Welcome to Wine List ----------"
    puts ""
    puts "Today's Top Wines:"
    puts ""
    @wines = WineList::Wine.today
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name} - #{wine.rating_price}"
    end
  end

  def list_years_wines
    current_year = Date.today.year
    puts ""
    puts "Top Wines of #{current_year}:"
    puts ""
    @wines = WineList::Wine.year
    @wines.each do |wine|
      puts "#{wine.name}"
    end
  end

  def menu
    current_year = Date.today.year
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of wine you'd like more info on, 'list' to see the wines again or 'exit':"
      puts ""
      puts "For the top wines of #{current_year} enter 'year':"
      puts ""
      input = gets.strip.downcase

    if input.to_i > 0
      the_wine = @wines[input.to_i - 1]
        puts ""
        puts "#{input.to_i}. #{the_wine.name} - #{the_wine.rating_price}"
        puts ""
        puts "---------- Description ----------"
        puts ""
        puts "#{the_wine.description}".split('—')
      elsif input == "list"
        list_todays_wines
      elsif input == "year"
        list_years_wines
      elsif input != "exit"
        puts "Your entry is invalid."
      end
    end
  end

  def goodbye
    puts ""
    puts "Thanks for coming! Cheers!"
    puts ""
  end

end
