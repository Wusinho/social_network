require 'rails_helper'

RSpec.describe "user_posts/show", type: :view do
  before(:each) do
    assign(:user_post, UserPost.create!(
      body: "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
  end
end
