class CursoPolicy < ApplicationPolicy

  def index?
  end

  def show?
  end

  def new?
    user.administrator? or user.coordenador?
  end


  def edit?
    user.administrator? or user.coordenador?
  end


  def create?
    user.administrator? or user.coordenador?

  end


  def update?
    user.administrator? or user.coordenador?

  end

  def destroy?
    user.administrator? or user.coordenador?
   end

  class Scope < Scope
    def resolve
      scope
    end
  end
end