require 'spec_helper'

describe Payment do

  describe "validations" do

    it { should validate_presence_of :borrower }
    it { should validate_presence_of :lender }
    it { should validate_presence_of :amount_cents }
    it { should validate_presence_of :description }
    it { should validate_presence_of :method }
    it { should validate_presence_of :date }
    it { should belong_to :borrower }
    it { should belong_to :lender }

  end
end
