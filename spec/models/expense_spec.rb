require 'spec_helper'

describe Expense do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :total_cents }
    it { should validate_presence_of :purchased_on }
    it { should belong_to :user }
  end

end
