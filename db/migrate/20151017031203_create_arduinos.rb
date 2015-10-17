class CreateArduinos < ActiveRecord::Migration
  def change
    create_table :arduinos do |t|
      t.integer :count
    end
  end
end
