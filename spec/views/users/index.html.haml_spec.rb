require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :Name => "Name",
        :Username => "Username",
        :Balance => 1,
        :password => "Password"
      ),
      User.create!(
        :Name => "Name",
        :Username => "Username",
        :Balance => 1,
        :password => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
