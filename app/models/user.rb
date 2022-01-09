class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password
  validates :namae, presence:true
  validates :email, presence:true

  before_update :admin_update_check
  before_destroy :admin_exist_check
  
  def admin_update_check
    if User.where(admin: true).count == 1 && self.admin == false && self.changes[:admin].nil? == false
      throw(:abort) 
    end
  end

  def admin_exist_check
    if User.where(admin: true).count == 1 && self.admin == true
      throw(:abort)
    end
  end
end
