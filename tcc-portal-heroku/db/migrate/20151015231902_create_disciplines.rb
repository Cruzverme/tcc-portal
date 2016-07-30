class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.integer :workload
      t.text :ementa
      t.text :description
      t.text :bibliography
      t.references :curso, index: true, foreign_key: true
      t.references :professor

      t.timestamps null: false
    end
  end
end
