# encoding: utf-8



class Recipe

  attr_accessor :time_start,   ## use date_start -why? why not?
                :time_end,
                :traits,
                :variants,
                :limit

  def initialize( **kwargs )
    update( kwargs )
  end

  def update( **kwargs )
    kwargs.each do |name,value|
      send( "#{name}=", value ) ## use "regular" plain/classic attribute setter
    end
    self   ## return self for chaining
  end

  ## is recipe time windowed? true/false
  def time?() @time_start && @time_end; end

  ## todo/check: assume @time_end is already a date - why? why not?  
  def time_days() (@time_end.to_date.jd - @time_start.to_date.jd) + 1; end
  
end  # class Recipe
