require 'spec_helper'

describe Flavors::Preference do

  it { should belong_to(:prefered) }

end
