class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :ip_video
      t.string :ip_audio
      t.boolean :disponivel
      t.string :sala
      t.datetime :horario_disponivel_inicial
      t.datetime :horario_disponivel_final
      t.references :curso, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
