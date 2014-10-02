FactoryGirl.define do 
 factory :comment do
    sequence(:title) {|n| "comment title no#{n}"}
    content "le flejm"
    article
  end

  factory :tag do
    sequence(:name) {|n| "tag no#{n}"}
  end

  factory :article do
    sequence(:title) {|n| "title no#{n}"}
    content "opis wpisu"

    # factory :article_with_comments do
    #   transient do
    #     comments_count 5
    #   end
    #   after(:create) do |article, evaluator|
    #     create_list(:comment, evaluator.comments_count, article: article)
    #   end 
    # end
  end
end