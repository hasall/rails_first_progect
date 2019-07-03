class Filter < ApplicationRecord
  belong_to :category
  has_many :filtervalue 
end
