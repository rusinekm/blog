FactoryGirl.define do 
  factory :article do
    sequence(:title) {|n| "title no#{n}"}
    content "opis wpisu"
  end

end