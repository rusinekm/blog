class Article < ActiveRecord::Base
  belongs_to :user
  default_scope {order('created_at DESC')}
  has_many :comments
  has_many :tags, through: :relations
  has_many :relations
  validates :content, presence: {message: "Comment area cannot be left empty"}
  def comment_number
    comments.count
  end


  def tag_names
  end

  def assign_tags(names_string)
    tag_names = names_string.split(',').map(&:strip)
    tag_names.each do |name|
      temp_tag = Tag.create_by_name(name)
      Relation.new(tag_id: temp_tag.id, article_id: id).save
    end
  end
          
  def display_date
    if Time.now - created_at > 7.days
       created_at.strftime('%e-%b-%Y')
    else
      created_at.strftime('%e-%b-%Y, %H:%M')
    end
  end  

end
