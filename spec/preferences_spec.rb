require 'spec_helper'
require 'flavors'

describe Flavors::Preferences do
  before do
    User.class_eval do
      preference :notification, :default => true
    end

    Post.class_eval do
      preference :sticky, :default => false
    end
  end

  subject { User.create }

  it "has a default value" do
    expect(subject.notification).to be_truthy
  end

  it "updates preference" do
    subject.notification = false
    expect(subject.notification).to be_falsy
  end

  it "scopes preferences for different classes" do
    expect {
      subject.sticky
    }.to raise_error NoMethodError
  end

  it "scopes default value for different classes" do
    Post.class_eval do
      preference :notification, :default => false
    end

    expect(subject.notification).to be_truthy
  end

  it "returns if nil if no default value defined" do
    User.class_eval do
      preference :foo
    end

    expect(subject.foo).to be_nil
  end

  it "invokes callback block" do
    User.class_eval do
      def buz; end

      preference :bar do |object, value|
        object.buz
      end
    end

    expect(subject).to receive(:buz)
    subject.bar = true
  end

  it "responds to the preference name with question mark" do
    expect(subject).to respond_to(:notification?)
    expect(subject).to be_notification
    subject.notification = false
    expect(subject).not_to be_notification
  end
end
