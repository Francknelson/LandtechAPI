class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, null: false
      t.string :skills, null: false

      t.bigint :recruiter_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :jobs,
                    :recruiters,
                    column: :recruiter_id,
                    name: 'jobs_recruiter_id_fkey'
  end
end
