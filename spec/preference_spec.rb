require 'spec_helper'

describe Flavors::Preference do

  it { is_expected.to belong_to(:prefered) }

end
