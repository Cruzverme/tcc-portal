class Camera < ActiveRecord::Base
  belongs_to :curso
  belongs_to :user
end
