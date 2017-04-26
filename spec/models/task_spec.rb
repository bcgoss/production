require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :estimate }
  it { should validate_presence_of :completed }
  it { should belong_to :list }
  it { should have_many :resources }
end
