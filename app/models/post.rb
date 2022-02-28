class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image
  validates:title,presence:true
  validates :user_id, presence: true
  # default_scope -> { order(created_at: :desc) }

   # has_one_attached :image

   def self.search(search)
    if search
      @posts=Post.where("posts.title Like ?",["%#{search}%"]).order("created_at DESC")
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      # find(:all)
      @posts=Post.all.order("created_at DESC")
    end
  end
end
