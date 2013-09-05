require 'spec_helper'

describe House do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end
end