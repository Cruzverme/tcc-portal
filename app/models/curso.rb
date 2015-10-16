class Curso < ActiveRecord::Base
  belongs_to :coordenador, :class_name => 'User'
  has_one :users
  has_many :disciplines, :dependent => :destroy
end
