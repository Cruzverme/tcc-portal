class RegistrationCoursePolicy < ApplicationPolicy

  def index?
    !user.nil? and (user.aluno? or user.professor? or user.coordenador? or user.administrador?)
  end

  def show?
    !user.nil? and (user.aluno? or user.professor? or user.coordenador? or user.administrador?)
  end

  def new?
    !user.nil? and user.aluno?
  end

  def edit?
    !user.nil? and user.aluno?
  end

  def create?
    !user.nil? and user.aluno?
  end

  def update?
    !user.nil? and user.aluno?
  end

  def destroy?
    !user.nil? and user.aluno?
   end

  class Scope < Scope
    def resolve
      scope
    end
  end
end