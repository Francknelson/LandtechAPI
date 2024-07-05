require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'validations' do
    subject(:submission) { create(:submission) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mobile_phone) }
    it { is_expected.to validate_presence_of(:resume) }
    it { is_expected.to validate_presence_of(:job_id) }

    context 'with blank name' do
      before { submission.name = nil }

      it { is_expected.not_to be_valid }
    end

    context 'with blank email' do
      before { submission.email = nil }

      it { is_expected.not_to be_valid }
    end

    context 'with blank mobile_phone' do
      before { submission.mobile_phone = nil }

      it { is_expected.not_to be_valid }
    end

    context 'with blank resume' do
      before { submission.resume = nil }

      it { is_expected.not_to be_valid }
    end

    context 'with blank job_id' do
      before { submission.job_id = nil }

      it { is_expected.not_to be_valid }
    end
  end
end
