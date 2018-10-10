class TextTagController < ApplicationController
  def text_tag
    @text = params.fetch("text")

    # ================================================================================
    # Your code goes below.
    # ================================================================================
    key = "simPWl/UWWvI44BM6voDkpU5zFD1"
    client = Algorithmia.client(key)
    algo = client.algo('nlp/AutoTag/1.0.1')
    @tags = algo.pipe(@text).result
  
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end
