class Tag < ActiveRecord::Base
  has_many :articles, through: :relations
  has_many :relations
end
