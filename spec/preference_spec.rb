require 'spec_helper'

describe Flavors::Preference, type: :model do
  it { is_expected.to belong_to(:prefered) }
end
