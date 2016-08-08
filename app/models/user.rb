class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:aluno, :professor, :coordenador, :administrador]

  belongs_to :curso, :dependent => :destroy
  belongs_to :discipline, :dependent => :destroy
  belongs_to :registration_course, :dependent => :destroy

  validates :nome, presence: true

  def course_exists?(course_id)
    RegistrationCourse.exists?(curso_id: course_id, aluno_id: self.id)
  end

  def forem_name
    nome
  end
end
