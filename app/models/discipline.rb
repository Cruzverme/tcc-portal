class Discipline < ActiveRecord::Base
  belongs_to :curso
  belongs_to :professor, :class_name => 'User'
  has_one :users

  validate :curso!
  validate :professor_ou_coordenador!

  def curso!
    if !self.curso_id.nil? or !self.curso_id.blank?
      if !Curso.exists?(self.curso_id)
        errors.add(:curso, "não existe.")
        return false
      else
        errors.delete(:curso)
        return true
      end
    else
      errors.add(:curso, "não pode ficar em branco.")
      false
    end
  end

  def professor_ou_coordenador!
    if !self.professor_id.nil? or !self.professor_id.blank?
      if User.exists?(self.professor_id)
        user = User.find(self.professor_id)
        if user.role == 'professor' or user.role == 'coordenador'
          errors.delete(:professor)
          true
        else
          errors.add(:professor, "ou Coordenador apenas.")
          false
        end
      else
        errors.add(:professor, " não existe.")
        false
      end
    else
      errors.add(:professor, "não pode ficar em branco.")
      false
    end
  end
end
