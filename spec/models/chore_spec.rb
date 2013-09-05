require 'spec_helper'

describe Chore do

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :frequency }
  end

end
