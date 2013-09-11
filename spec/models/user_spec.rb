require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  describe "validations" do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should allow_value('example@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
    it { should have_many :authentications }
    it { should belong_to :house }
    it { should have_and_belong_to_many :grocery_lists }
    it { should have_many :settlements }
    it { should have_many :expenses }
  end

  describe "find_or_create_by_omniauth method" do
    context "authentication exists" do
      let(:authentication) { create :authentication }
      it "returns authentication.user" do
        auth = {"provider" => authentication.provider, "uid" => authentication.uid}
        expect(User.find_or_create_by_omniauth(auth)).to eq authentication.user
      end
    end
    context "authentication doesn't exist" do
      it "creates a new User with info from auth" do
        auth = {'info' => attributes_for(:user).stringify_keys, "provider" => "anything", "uid" => "something", "credentials" => {"token" => "a token"}}
        expect {
          user = User.find_or_create_by_omniauth(auth)
          expect(user.name).to eq auth['info']['name']
          expect(user.email).to eq auth['info']['email']
        }.to change(User, :count).by(1)
      end

      it "authenticates user" do
        auth = {'info' => attributes_for(:user).stringify_keys, "provider" => "anything", "uid" => "something", "credentials" => {"token" => "a token"}}
        user = User.find_or_create_by_omniauth(auth)
        expect { user.authentications }.to_not eq(nil)

      end

      # fix to make sure user = user with factorygirl
      it "returns user" do
        let(:user) { create(:user) }
        auth = {'info' => attributes_for(:user).stringify_keys, "provider" => "anything", "uid" => "something", "credentials" => {"token" => "a token"}}
        user = User.find_or_create_by_omniauth(auth)
        expect { user }.to_not eq(nil)
      end
    end

    it "responds to :find_or_create_by_omniauth method" do
      User.should respond_to(:find_or_create_by_omniauth).with(1).argument
    end


  end
end
