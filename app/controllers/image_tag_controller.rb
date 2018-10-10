class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    key = ENV['ALGORITHMIA_KEY']
    client = Algorithmia.client(key)
    algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
    result = algo.pipe(input).result
    @tag_hashes = result.fetch("general")

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("image_tag/image_tag.html.erb")
  end
end
