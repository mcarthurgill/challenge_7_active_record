class SkillUsers < ActiveRecord::Migration
  def change
  	create_table :skill_users do |t|
  		t.references :skill
  		t.references :user
  		t.integer :proficiency_rating, :default => 0
  	end
  end
end
