require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "validations" do
    subject(:job) { create(:job) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:skills) }
    it { is_expected.to validate_presence_of(:recruiter_id) }

    context "with blank title" do
      before { job.title = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank description" do
      before { job.description = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank start_date" do
      before { job.start_date = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank end_date" do
      before { job.end_date = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank status" do
      before { job.status = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank skills" do
      before { job.skills = nil }

      it { is_expected.not_to be_valid }
    end

    context "with blank recruiter_id" do
      before { job.recruiter_id = nil }

      it { is_expected.not_to be_valid }
    end
  end
end
