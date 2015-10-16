class Discipline < ActiveRecord::Base
  belongs_to :curso
  belongs_to :professor, :class_name => 'User'
  has_one :users

  validate :curso_exists?
  validate :professor_exists?

  def curso_exists?
    if !Curso.exists?(self.curso_id)
      errors.add(:curso, "não existe.")
      return false
    else
      errors.delete(:curso)
      return true
    end
  end

  def professor_exists?
    if !User.exists?(self.professor_id)
      errors.add(:professor, "não existe.")
      return false
    else
      errors.delete(:professor)
      return true
    end
  end
end
