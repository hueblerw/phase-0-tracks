# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Require Relative uses the current files present location to measure the location of other files by
# Require uses the an absolute location, could be you computer's main origin or the repository location to measure location by.

require_relative 'state_data'

class VirusPredictor

  # Initializes the values for the variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # runs two methods, predicted death and speed_of spread while feeding in instance variables.
  
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Generating an number of death estimated based on population density and population for a given state.  It prints that statement out at the end with the results.
  def predicted_deaths
    # predicted deaths is solely based on population density
    # if @population_density >= 200
    #   number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150
    #   number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100
    #   number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50
    #   number_of_deaths = (@population * 0.1).floor
    # else
    #   number_of_deaths = (@population * 0.05).floor
    # end

    done = false
    pop = 200
    multiplier = 0.4
    begin 
      if (@population_density >= pop)
        number_of_deaths = (@population * multiplier).floor
        done = true
      end
      pop -= 50
      multiplier -= 0.1
    end until (done || pop == 0)
    if (!done) 
      number_of_deaths = (@population * 0.05).floor
    end
    
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Based on the population density it determines the estimated time it takes the disease to cross the given state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    spread_time = 0.0

    # if @population_density >= 200
    #   speed += 0.5
    # elsif @population_density >= 150
    #   speed += 1
    # elsif @population_density >= 100
    #   speed += 1.5
    # elsif @population_density >= 50
    #   speed += 2
    # else
    #   speed += 2.5
    # end

    done = false
    pop = 200
    time_factor = 0.5
    begin 
      if (@population_density >= pop)
        spread_time += time_factor
        done = true
      end
      pop -= 50
      time_factor += 0.5
    end until (done || pop == -50)
    
    puts " and will spread across the state in #{spread_time} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state,pop_info|
  temp_state = VirusPredictor.new(state, pop_info[:population_density], pop_info[:population])
  temp_state.virus_effects
end 



# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# The arrow hash is less efficient to call up but allows you to link two variables together.
# The symbol :hash is more efficent calling up information but it means the key is a symbol not a variable.

# What does require_relative do? How is it different from require?
# Require Relative uses the current files present location to measure the location of other files by
# Require uses the an absolute location, could be you computer's main origin or the repository location to measure location by.

# What are some ways to iterate through a hash?
# The .each loops if you want to iterate everything.
# The begin until loop
# for loops (though I think ruby people seem to frown upon them)?
# while loops

# When refactoring virus_effects, what stood out to you about the variables, if anything?
# For me how subtle the difference between @var and var is.  It can easily be missed if you aren't looking for it carefully.

# What concept did you most solidify in this challenge?
# Definitely gained a much better understanding of hashes.