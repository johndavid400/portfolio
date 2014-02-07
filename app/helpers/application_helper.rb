module ApplicationHelper

  def image_url(image)
    "#{image.title} - <a class='reg_link' href='#{image.image.url}'>Click here to view full size</a>"
  end

end
