require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
   setup do
    @article_hash = FactoryGirl.attributes_for(:article) 
  end
  test 'checking duplication of tags' do
    assert_difference("Article.count",2) do
      post :create, article: @article_hash.merge(tag_names:"jeden,dwa,trzy")
      post :create, article: @article_hash.merge(tag_names:"jeden, dwa, trzy")
    end
    assert Tag.where(name:"jeden").count == 1
    assert Tag.count == 3
  end
  # test "the truth" do
  #   assert true
  # end
end
