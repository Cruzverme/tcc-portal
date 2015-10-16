class Curso < ActiveRecord::Base
  belongs_to :coordenador, :class_name => 'User'
  has_one :users
  has_many :disciplines, :dependent => :destroy
  has_many :registration_courses, :dependent => :destroy

  validate :coordenador!

  def coordenador!
    if !self.coordenador_id.nil? or !self.coordenador_id.blank?
      if User.exists?(self.coordenador_id)
        coordenador = User.find(self.coordenador_id)
        if coordenador.role == 'coordenador'
          errors.delete(:coordenador)
          true
        else
          errors.add(:coordenador, "apenas.")
          false
        end
      else
        errors.add(:coordenador, "não existe.")
        false
      end
    else
      errors.add(:coordenador, "não pode ficar em branco.")
      false
    end
  end
end
