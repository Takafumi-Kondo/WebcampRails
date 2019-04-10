Rails.application.routes.draw do
  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'root#top'

  post 'posts' => 'posts#create' #../postsのurlにpostでリクしたときにpostsコントローラーのcreateアクションが呼び出される


  get 'posts' => 'posts#index'

  #投稿１件ごとの詳細を表示
  get 'posts/:id' => 'posts#show', as: 'post'#as: '名前' はURLを簡潔に
  		#.../posts/1 や .../posts/3 に該当する

  #どの投稿を編集するかを識別する(詳細画面の表示と同じように)
  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'
  #posts/〜〜/edit というURL全て該当↑↑
  patch 'posts/:id' => 'posts#update', as: 'update_post'#新規はpost,更新はpatch
end
