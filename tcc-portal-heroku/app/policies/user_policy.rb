class UserPolicy < ApplicationPolicy

  def index?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def show?
    !user.nil? and (user.aluno? or user.professor? or user.coordenador? or user.administrador?)
  end

  def new?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def edit?
    !user.nil? and (user.aluno? or user.professor? or user.coordenador? or user.administrador?)
  end

  def create?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def update?
    !user.nil? and (user.aluno? or user.professor? or user.coordenador? or user.administrador?)
  end

  def destroy?
    !user.nil? and (user.administrador? or user.coordenador?)
   end

  class Scope < Scope
    def resolve
      if user.administrador?
        scope.all
      else
        scope
      end
    end
  end
end