class Job < ApplicationRecord
  validates :title,
            :description,
            :status,
            :start_date,
            :end_date,
            :skills,
            :recruiter_id,
            presence: true

  belongs_to :recruiter

  def self.search(search)
    if search
      where('status = :status and (title ILIKE :term OR description ILIKE :term OR skills ILIKE :term )', status: "Ativo", term: "%#{search}%")
    else
      where('status = :status', status: 'Ativo')
    end
  end
end
