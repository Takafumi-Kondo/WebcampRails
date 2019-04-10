class PostsController < ApplicationController
    def new
  	#空のモデルをビューへ渡す
    	@post = Post.new #空モデル作成を左へ
    end

    #送信されたフォーム値をDBに。(postインスタンスを生成しtitle,bodyに値セット後、saveメソッド呼)
    def create #privateより上に
    	#ストロングパラメーター使用
    	post = Post.new(post_params)#ローカル変数なので@なし。アクション内のみ使用可
        	#DBへ保存
    	post.save
    	#保存後トップ画面へリダイレクト
    	redirect_to post_path(post.id)#どの投稿かを指定.id
    end#↑↑投稿後すぐ内容を観れるよう'/top'を変更(詳細画面へリダイレクト)


    def index
      @posts = Post.all
    end#全てのデータ取って@postsへ。全てなので複数

    #URL中のidをコントローラーで受け取るroutes.rbから
    def show
      @post = Post.find(params[:id])
    end#params[:id]で:idにある値を取得。URL/posts/1ならparamsには「{id: 1}」ハッシュがある

    #編集するには投稿データ必要。なので保存データ取得
    def edit
      @post = Post.find(params[:id])
    end

    def update #投稿の更新
      post = Post.find(params[:id])
      post.update(post_params)
      redirect_to post_path(post.id)
    end

    #create作成　フォームからのデータ受け取り、そのデータをモデルを介しDBに保存
    private #メソッド前に、認識されなくなる。下に

    def post_params #投稿ボタンがトリガー、postsコントのcreateアクフォームに入った値が送信される
    	params.require(:post).permit(:title, :body, :image)
    end# 			　モデル名			　カラムな     gemのImagemagick使う時追加(:image)
  end