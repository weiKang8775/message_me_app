class Friendship < ApplicationRecord
  belongs_to :user, :foreign_key => :friend_id

  after_create do |u|
    if !Friendship.find_by :friend_id => u.user_id, :user_id => u.friend_id
      Friendship.create!(user_id: u.friend_id, friend_id: u.user_id)
    end
  end

  after_destroy do |u|
    target = Friendship.find_by :friend_id => u.user_id, :user_id => u.friend_id
    target.destroy unless target.nil?
  end
end