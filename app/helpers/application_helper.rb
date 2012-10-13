module ApplicationHelper
  def gravatar_image_tag(user)
    default_url = "#{root_url}assets/guest.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    image_tag("http://gravatar.com/avatar/#{gravatar_id}.png?s=108&d=#{CGI.escape(default_url)}")
  end
end
