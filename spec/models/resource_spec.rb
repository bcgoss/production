require 'rails_helper'

RSpec.describe Resource, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
  it { should have_many :tasks }
end
