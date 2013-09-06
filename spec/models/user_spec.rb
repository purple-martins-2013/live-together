require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  describe "validations" do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should allow_value('example@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
    it { should belong_to :house }
    it { should have_and_belong_to_many :grocery_lists }
  end
end
