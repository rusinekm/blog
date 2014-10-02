require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
   setup do
    @article_hash = FactoryGirl.attributes_for(:article) 
  end

  test "creating new article" do
    assert_difference("Article.count",1) do
      # post :create, product: { title: "Okaoaaa", price: 25.54, description: "takie w głowie lub w rosole"
      post :create, article: @article_hash.merge(tag_names: "")  
    end    
    assert_response :redirect
    assert_redirected_to articles_path
  end

  test 'checking duplication of tags' do
    assert_difference("Article.count",2) do
      post :create, article: @article_hash.merge(tag_names:"jeden,dwa,trzy")
      post :create, article: @article_hash.merge(tag_names:"jeden, dwa, trzy")
    end
    assert Tag.where(name:"jeden").count == 1
    assert Tag.count == 3
  end

   test "testing if new works" do
    get :new 
    assert_response :success
    assert_template :new
  end

  test "testing if show works" do
    #tst = "/product/"+products(:two).id.to_s
    #tst = "/product/"+.id.to_s
    FactoryGirl.create(:article)
    get :show, {id: Article.last.id}
    assert_template :show
    assert_response :success
    assert_equal Article.last, assigns(:article)
  end
  
  # test "the truth" do
  #   assert true
  # end
end
