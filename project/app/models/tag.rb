class Tag < ActiveRecord::Base
  has_many :articles, through: :relations
  has_many :relations

  def self.create_by_name(name)
    optional_tag = find_by(name: name) 
    if optional_tag
      optional_tag
    else
      new(name: name).tap do |tag|
        tag.save
      end 
    end 
  end

end
