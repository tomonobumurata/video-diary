class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :star
  belongs_to :place

  with_options presence: true do
    validates :title
    validates :genre_id
    validates :star_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :star_id
    validates :place_id
  end
end
