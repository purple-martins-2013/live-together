require 'spec_helper'

describe Invitation do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :user }
  end

  describe "relations" do
    it { should belong_to :user }
  end
end
