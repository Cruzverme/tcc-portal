class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:aluno, :professor, :coordenador, :administrador]

  belongs_to :curso, :dependent => :destroy
  belongs_to :discipline, :dependent => :destroy
  has_many :registration_courses, :dependent => :destroy

  def course_exists?(course_id)
    RegistrationCourse.exists?(curso_id: course_id, aluno_id: self.id)
  end
end
