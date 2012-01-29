require 'spec_helper'

describe 'Voting on tweets' do

  it 'increments the tweet count when voted on' do
    user = User.create username: 'brennandunn'
    user.tweets.create content: 'Hello'

    visit '/'
    click_link 'brennandunn'
    page.should have_content '0'
    click_button '+'

    page.should have_content '1'
    click_button '+'
    page.should have_content '1'
  end

end
