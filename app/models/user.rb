class User < ActiveRecord::Base
  has_many :skill_users
  has_many :skills, :through => :skill_users
  validates :name, :email, :presence => true

  def proficiency_for(skill)
  	self.skill_users.find_by_skill_id(skill.id).proficiency_rating
  end

  def set_proficiency_for(skill, rating)
  	searched_skill = Skill.find(skill.id)
  	self.skill_users.find_by_skill_id(searched_skill.id).update_attributes(proficiency_rating: rating)
  end
end
