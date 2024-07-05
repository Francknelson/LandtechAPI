class Submission < ApplicationRecord
  validates :name,
            :email,
            :mobile_phone,
            :resume,
            presence: true

  validates :job_id,
            presence: true,
            uniqueness: true


  belongs_to :job
end
