class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :professores
      t.string :alunos
      t.integer :carga_horaria
      t.string :coordenador

      t.timestamps null: false
    end
  end
end
