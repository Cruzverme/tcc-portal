class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.integer :carga_horaria
      t.text :descricao
      t.references :aluno
      t.references :professor
      t.references :coordenador

      t.timestamps null: false
    end
  end
end
