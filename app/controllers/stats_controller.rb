class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count.to_s

    @minimum = @sorted_numbers[0].to_s

    @maximum = @sorted_numbers[@sorted_numbers.length-1].to_s

    @range = (@maximum.to_f - @minimum.to_f).to_s

    # Median
    # ======
    median = -1
    half = @numbers.length/2
    if !@numbers.length.even?
      median = @sorted_numbers[@numbers.length/2]
    else
      l = @sorted_numbers[half - 1].to_f
      r = @sorted_numbers[half].to_f
      # median = half
      median = (l+r)/2.0
    end
    max = 0
    @numbers.each do |i|
      max+=i
    end
    @median = median.to_s

    @sum = max.to_s
    max /= @numbers.length
    @mean = max.to_s

    # Variance
    # ========
    var = 0.to_f
    freq = Hash.new(0)
    max = 0
    times = 0
    @numbers.each do |n|
      freq[n] += 1
      if max < freq[n]
        max = n
        times = freq[n]
      end
      var += (n - @mean.to_f)**2
    end
    @variance = (var / @numbers.count).to_s

    @standard_deviation = (Math.sqrt(var / @numbers.count)).to_s

    # Mode
    # ====
    freq = freq.sort_by {|_key, value| -value}
    if freq.length == 1 || (freq[0][1] != freq[1][1])
      mo = freq[0][0].to_s
    else
      mo = "No Mode"
    end
    @mode = mo

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats/stats.html.erb")
  end
end
