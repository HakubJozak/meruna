class TestPublisher < Facebooker::Rails::Publisher

  def publish_action_template
    one_line_story_template "{*actor*} did stuff with {*friend*}"
  end

  def publish_action
    send_as :notification
  end
  
end
