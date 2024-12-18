class Following < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, uniqueness: { scope: :followed_id }
  validate :not_self_following

  private

  def not_self_following
    if follower_id == followed_id
      errors.add(:base, "Users cannot follow themselves")
    end
  end
end
