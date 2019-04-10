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
  	redirect_to '/top'
  end

  #create作成　フォームからのデータ受け取り、そのデータをモデルを介しDBに保存
  private #メソッド前に、認識されなくなる。下に

  def post_params #投稿ボタンがトリガー、postsコントのcreateアクフォームに入った値が送信される
  	params.require(:post).permit(:title, :body)
  end# 			　モデル名			　カラムな
end
