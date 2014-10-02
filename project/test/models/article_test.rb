require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'displaying time less than 7 days' do
    FactoryGirl.create(:article)
    assert_equal Article.last.display_date, Time.now.in_time_zone("UTC").strftime('%e-%b-%Y, %H:%M')
  end
  test 'displaying time more than 7 days' do
    FactoryGirl.create(:article, created_at:DateTime.new(2011,2,3))
    assert_equal Article.last.display_date, DateTime.new(2011,2,3).strftime('%e-%b-%Y')
  end

  test 'checking for working comments under articles' do
    art = FactoryGirl.create(:article)
    p1 = FactoryGirl.create(:comment)
    p2 = FactoryGirl.create(:comment)
    p3 = FactoryGirl.create(:comment)
    p1.article = art
    p1.save
    p2.article = art
    p2.save
    p3.article = art
    p3.save
    assert_equal 3, art.comments.count
  end
  # test "the truth" do
  #   assert true
  # end
end
