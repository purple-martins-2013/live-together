require 'spec_helper'

describe Authentication do

  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :token }
end
