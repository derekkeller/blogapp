class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :posts

  has_many :microposts
  
  has_many :relationships,  :foreign_key => "follower_id",
                            :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                    :class_name => "Relationship",
                                    :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower  
  
  
  def following?(name)
    relationships.find_by_followed_id(name)    
  end
  
  def follow!(name)
    relationships.create!(:followed_id => name.id)    
  end

  def unfollow!(name)
    relationships.find_by_followed_id(name).destroy    
  end
  
end
