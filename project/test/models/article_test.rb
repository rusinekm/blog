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
  # test "the truth" do
  #   assert true
  # end
end
