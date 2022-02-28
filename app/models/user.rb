class User < ApplicationRecord
  has_secure_password

  validates:first_name,presence:true
  validates:last_name,presence:true
  validates:username,presence:true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates:password_digest,length:{minimum:8}
  has_one_attached :avatar

  has_many :posts, dependent: :destroy
  has_many :likes

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  has_many :messages
  # has_many :private_messages, class_name: 'Private::Message'
  # has_many  :private_conversations,
  #         foreign_key: :sender_id,
  #         class_name: 'Private::Conversation'



  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

 def friends
   friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
   friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
   ids = friends_i_sent_invitation + friends_i_got_invitation
   User.where(id: ids)
 end

 def friend_with?(user)
   Invitation.confirmed_record?(id, user.id)
 end

 def send_invitation(user)
   invitations.create(friend_id: user.id)
 end


end
