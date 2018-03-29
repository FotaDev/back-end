require 'rails_helper'

RSpec.feature "Hires", type: :feature do
  describe 'some stuff which reuires js', js: true do
    it 'will use the default js driver' do
      create(:group)
      create(:user, email: "jacek@pies.com", password: 123456789)
      visit 'localhost:4200'
      find(:xpath, "/html/body/app-root/app-toolbar/div/nav/div/ul/li[1]/a").click
      fill_in 'Email', with: 'john@jacek.com'
      fill_in 'Password', with: '123456789'
      # to be continued
    end
  end
end
