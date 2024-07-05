class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile_phone, null: false
      t.string :resume, null: false

      t.bigint :job_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :submissions,
                    :jobs,
                    column: :job_id,
                    name: 'submission_job_id_fkey'
  end
end
