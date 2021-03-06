class DisciplinePolicy < ApplicationPolicy

  def index?
  end

  def show?
  end

  def new?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def edit?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def create?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def update?
    !user.nil? and (user.administrador? or user.coordenador?)
  end

  def destroy?
    !user.nil? and (user.administrador? or user.coordenador?)
   end

  class Scope < Scope
    def resolve
      scope
    end
  end
end