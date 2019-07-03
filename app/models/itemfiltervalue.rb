class Itemfiltervalue < ApplicationRecord
  belong_to :filtervalue
  belong_to :item
end
