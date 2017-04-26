require 'rails_helper'

RSpec.describe TaskResource, type: :model do
  it { should belong_to :task }
  it { should belong_to :resource }

end
