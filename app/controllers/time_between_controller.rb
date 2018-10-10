class TimeBetweenController < ApplicationController
  def time_between
    @starting = Chronic.parse(params.fetch("starting_time"))
    @ending = Chronic.parse(params.fetch("ending_time"))

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    dif = @ending - @starting
    @seconds = dif
    @minutes = (dif / 60)
    @hours = (dif / 3600)
    @days = ((dif / 3600) / 24)
    @weeks = ((dif / 3600) / 24) / 7
    @years = (((dif / 3600) / 24) / 365)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between/time_between.html.erb")
  end
end
