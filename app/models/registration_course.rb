class RegistrationCourse < ActiveRecord::Base
  belongs_to :curso
  belongs_to :aluno, :class_name => 'User'
  has_many :users
end
