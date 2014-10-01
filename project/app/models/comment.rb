class Comment < ActiveRecord::Base
  belongs_to :article
# belongs_to :user
    def display_date
    if Time.now - created_at > 7.days
       created_at.strftime('%e-%b-%Y')
    else
      created_at.strftime('%e-%b-%Y, %H:%M')
    end
  end
end
