class User < ApplicationRecord
  has_many :posts
  has_many :todos
  has_many :invitations
  has_many :messages
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: 'friend_id'
  validates :username, presence: true
  after_update :current_user_status

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friends_list(friend_id)
    Room.find_by(user_id: self.id, friend_id: friend_id)
  end

  def current_user_status
    ActionCable.server.broadcast "UserStatusChannel:#{id}", {
      user: render_comment
    }
  end

  def render_comment
    ListsController.renderer.instance_variable_set(
      :@env, {
      "HTTP_HOST"=>"localhost:3000",
      "HTTPS"=>"off",
      "REQUEST_METHOD"=>"GET",
      "SCRIPT_NAME"=>"",
      "warden" => self
    }
    )

    ListsController.render(
      partial: 'user',
      locals: {
        friend: self,
      }
    )
  end


  def valid_friends
    User.where.not(id: self.id).where.not(id: self.friends)
  end


  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_got_invitation + friends_i_sent_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    return true if self == user

    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    Invitation.create(friend_id: user.id)
  end

end
