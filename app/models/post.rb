class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  def self.search(query)
    if query
      where("title = ?", "%#{query}%")
    else
      all
    end
  end

end
