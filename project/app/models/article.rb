class Article < ActiveRecord::Base
# belongs_to :user
  has_many :comments
  has_many :tags, through: :relations
  has_many :relations
  validates :content, presence: {message: "Comment area cannot be left empty"}
  def comment_number
    comments.count
  end

  def tag_names
  end

  def display_date
    if Time.now - created_at > 7.days
       created_at.strftime('%e-%b-%Y')
    else
      created_at.strftime('%e-%b-%Y, %H:%M')
    end
  end

end
