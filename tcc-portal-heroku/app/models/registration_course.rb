class RegistrationCourse < ActiveRecord::Base
  belongs_to :curso
  belongs_to :aluno, :class_name => 'User'
  has_many :users

  validate :curso!
  validate :aluno!
  validate :aluno_curso_exists?

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

  def aluno!
    if !self.aluno_id.nil? or !self.aluno_id.blank?
      if User.exists?(self.aluno_id)
        user = User.find(self.aluno_id)
        if user.role == 'aluno'
          errors.delete(:aluno)
          true
        else
          errors.add(:aluno, "apenas.")
          false
        end
      else
        errors.add(:aluno, "não existe.")
        false
      end
    else
      errors.add(:aluno, "não pode ficar em branco.")
      false
    end
  end

  def aluno_curso_exists?
    if ( !self.aluno_id.nil? or !self.aluno_id.blank? ) and ( !self.curso_id.nil? or !self.curso_id.blank? )
      if self.id.nil?
        if RegistrationCourse.exists?(aluno_id: self.aluno_id, curso_id: self.curso_id)
          errors.add(:aluno, "já se encontra matriculado neste curso.")
          true
        else
          false
        end
      else
        if RegistrationCourse.exists?(aluno_id: self.aluno_id, curso_id: self.curso_id)
          registration_course = RegistrationCourse.where(aluno_id: self.aluno_id, curso_id: self.curso_id).first
          if registration_course.id != self.id
            errors.add(:aluno, "já se encontra matriculado neste curso.")
            true
          else
            false
          end
        else
          false
        end
      end
    end
  end
end
