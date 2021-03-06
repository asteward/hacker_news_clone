require 'rails_helper'

describe Post do
  it { should belong_to(:user) }

  it { should have_many(:comments) }

  it { should have_many(:votes) }
end
