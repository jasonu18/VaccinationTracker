class Patient < ApplicationRecord
  #variable used to save patient image
  has_one_attached :avatar
end
