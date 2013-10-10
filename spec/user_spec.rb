require 'spec_helper'

describe User do 

  describe '#username' do 
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe '#password' do
    it { should validate_presence_of(:password) }
  end


end