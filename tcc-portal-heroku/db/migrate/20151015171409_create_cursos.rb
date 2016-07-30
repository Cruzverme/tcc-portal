class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.text :descricao
      t.references :coordenador

      t.timestamps null: false
    end
  end
end
