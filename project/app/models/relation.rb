class Relation < ActiveRecord::Base
  belongs_to :article, class_name: "Article"
  belongs_to :tag, class_name: "Tag"
end
