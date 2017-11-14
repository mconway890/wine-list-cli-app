# Our CLI Controller
class WineList::CLI

  def call
    list_todays_wines
    menu
    goodbye
  end

  def list_todays_wines
    puts center("Welcome to Wine List")
    puts ""
    puts "  Today's Top Wines:"
    puts ""
    @wines = WineList::Wine.today
    @wines.each.with_index(1) do |wine, i|
      puts " #{i}. #{wine.name} - #{wine.rating_price}"
    end
  end

  def list_years_wines
    current_year = Date.today.year
    puts ""
    puts "Top Wines of #{current_year}:"
    puts ""
    @wines = WineList::Wine.scrape
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name}"
    end
  end

  def menu
    current_year = Date.today.year
    input = nil
    while input != "exit"
      puts ""
      puts wrap("Enter the number of wine you'd like more info on, 'list' to see today's wines again or 'exit'. For the top wines of #{current_year} enter 'year': ")
      puts ""
      input = gets.strip.downcase


    if input.to_i > 0
      the_wine = @wines[input.to_i - 1]
        puts ""
        puts "#{input.to_i}. #{the_wine.name} - #{the_wine.rating_price}"
        puts center("Description")
        puts ""
        puts wrap("#{the_wine.description}").split('—')
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

  def center(string, c = "-")
    string = " #{string} " if string != ""
    until string.length >= 40
      string.prepend(c)
      string << (c)
    end
    string.prepend("\n")
  end

  def wrap(s, width=70)
	  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
	end

end
