require 'rails_helper'

RSpec.describe List, type: :feature do
  it 'shows a specific list' do
    pending 'Cant render html in this app'
    list = create :list, name: 'The List'

    visit list_path(list)

    expect(page).to have_content 'The List'
  end
end
