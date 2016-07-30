class Arduino < ActiveRecord::Base

  def left
    "esquerda"
  end

  def right
    "direita"
  end

  def up
    "cima"
  end

  def down
    "baixo"
  end
end