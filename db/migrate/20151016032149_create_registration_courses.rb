class CreateRegistrationCourses < ActiveRecord::Migration
  def change
    create_table :registration_courses do |t|
      t.date :admission_date
      t.boolean :locked
      t.date :conclusion_date
      t.references :curso, index: true, foreign_key: true
      t.references :aluno

      t.timestamps null: false
    end
  end
end
