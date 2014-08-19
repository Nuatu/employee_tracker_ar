require 'spec_helper'

describe Employee do
  it { should have_many(:projects).through(:assignments) }
end
