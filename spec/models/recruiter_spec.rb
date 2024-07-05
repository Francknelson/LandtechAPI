require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  describe "validations" do
    subject(:recruiter) { build(:recruiter) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to have_secure_password }

    context "#password" do
      subject(:recruiter) { build(:recruiter, password: nil) }

      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
    end
  end

end
