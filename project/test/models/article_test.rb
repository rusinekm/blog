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

  test 'tag test' do
    article = FactoryGirl.create(:article)
    tag1 = FactoryGirl.create(:tag)
    tag2 = FactoryGirl.create(:tag)
    Relation.new(tag_id: tag1.id, article_id: article.id).save
    Relation.new(tag_id: tag2.id, article_id: article.id).save

    assert_equal article.tags.count, 2
  end

    test 'search test' do
    article = FactoryGirl.create(:article)
    tag1 = FactoryGirl.create(:tag)
    tag2 = FactoryGirl.create(:tag)
    Relation.new(tag_id: tag1.id, article_id: article.id).save
    Relation.new(tag_id: tag2.id, article_id: article.id).save
    assert_equal Article.search(nil), Article.all
    assert_equal Article.search(tag1.id), [article]
    assert_equal article.tags.count, 2
  end

  test 'checking for working comments under articles' do
    article = FactoryGirl.create(:article)
    p1 = FactoryGirl.create(:comment)
    p2 = FactoryGirl.create(:comment)
    p3 = FactoryGirl.create(:comment)
    p1.article = article
    p1.save
    p2.article = article
    p2.save
    p3.article = article
    p3.save
    assert_equal 3, article.comments.count
  end
  # test "the truth" do
  #   assert true
  # end
end
