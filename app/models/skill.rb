class Skill < ActiveRecord::Base
  has_many :skill_users
  has_many :users, :through => :skill_users
  validates :name, :context, :presence => true
  validates_uniqueness_of :name

  def user_with_proficiency(rating)
  	user_id = self.skill_users.find_by_proficiency_rating(rating).user_id
  	User.find(user_id)
  end
end
