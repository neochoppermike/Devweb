class Product < ApplicationRecord
  has_many :orders  
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :price, presence: true

  
  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike :search_term OR description ilike :search_term", search_term: "%#{search_term}%")
    else
      Product.where("name LIKE :search_term OR description LIKE :search_term", search_term: "%#{search_term}%")
    end  
  end

  def highest_rating_comment
  	comments.rating_desc.first
  end	

  def lowest_rating_comment
    comments.rating_asc.first if comments.count > 1
  end

  def average_rating
      comments.average(:rating).to_f
  end


end


