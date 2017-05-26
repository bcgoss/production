require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :estimate }
  it { should belong_to :list }
  it { should have_many :resources }

  it 'can be marked as complete' do
    task = create :task
    expect{task.complete!}.to change{task.progress}.from("started").to("complete")
  end
end
