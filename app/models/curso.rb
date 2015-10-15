class Curso < ActiveRecord::Base
  belongs_to :coordenador, :class_name => 'Usuario'
  has_one :usuarios
end
