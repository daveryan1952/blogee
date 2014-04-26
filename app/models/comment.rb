class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
# sscope :chronological, : order => :created_at
  validates :content, :presence => true
  validates :content, length: { minimum: 16, message: "must be at least 15 characters long." }
  validates :author, :presence => true
end
