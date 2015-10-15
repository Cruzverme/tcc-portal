class Curso < ActiveRecord::Base
  belongs_to :aluno, :class_name => 'Usuario'
  belongs_to :professor, :class_name => 'Usuario'
  belongs_to :coordenador, :class_name => 'Usuario'
  has_many :usuarios
end
