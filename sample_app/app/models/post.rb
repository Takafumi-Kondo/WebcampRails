class Post < ApplicationRecord
#refileを使う時はモデル(postモデルにattachmentメソッドを
	attachment :image
end
