require 'rails_helper'

describe Comment do
  it { should belong_to(:post) }

  it { should belong_to(:user) }
end
