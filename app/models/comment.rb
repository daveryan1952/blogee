class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, :presence => true
  validates :content, length: { minimum: 16, message: "must be at least 15 characters long." }
  validates :author, :presence => true
end
