require 'cryptocompare'
class Post < ActiveRecord::Base
    
    acts_as_votable
    
#    validates :image, presence: true
    validates :user_id, presence: true
    validates :caption, presence: true, length: { minimum: 4, maximum: 300 }
#   validates :youtube, presence: true
    
    has_attached_file :image, styles: { :medium => "640x" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    has_many :notifications, dependent: :destroy 
    
    scope :of_followed_users, -> (following_users) { where user_id: following_users }
    
    @coinlist = Cryptocompare::CoinList.all
end
