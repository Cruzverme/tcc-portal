class Curso < ActiveRecord::Base
  belongs_to :coordenador, :class_name => 'User'
  has_one :users
end
