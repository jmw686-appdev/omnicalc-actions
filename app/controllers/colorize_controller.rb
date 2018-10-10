class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    key = ENV['ALGORITHMIA_KEY']
    client = Algorithmia.client(key)
    algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
    result = algo.pipe(input).result.fetch("output")
    @colorized_image_url = "https://algorithmia.com/v1/data/" + result[7, result.length-6]

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize/colorize.html.erb")
  end
end
