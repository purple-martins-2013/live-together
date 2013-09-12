require 'spec_helper'

describe Debt do

  describe 'Validations' do

    it {should validate_presence_of :borrower }
    it {should validate_presence_of :lender }
    it {should validate_presence_of :expense }
    it {should validate_presence_of :amount_cents }
    it {should belong_to :borrower}
    it {should belong_to :lender}
  end
end
