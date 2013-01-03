require 'spec_helper'
require 'flavors'

describe Flavors::Preferences do
  before do
    User.class_eval do
      preference :notification, :default => true
    end
  end

  subject { User.create }

  it "should have a default value" do
    subject.notification.should == true
  end

  it "should update preference" do
    subject.notification = false
    subject.notification.should == false
  end

end
