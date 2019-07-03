class Filtervalue < ApplicationRecord
  belong_to :filter
  has_many :itemfiltervalues 
end
