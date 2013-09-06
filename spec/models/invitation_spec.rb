require 'spec_helper'

describe Invitation do
  describe "validations" do
    it { should validate_presence_of :email }
  end

  describe "relations" do
    it { should belong_to :house }
  end
end
