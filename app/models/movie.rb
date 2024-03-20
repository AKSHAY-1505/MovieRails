class Movie < ApplicationRecord
    validates :name, presence: true 
    validates :director, presence: true
    validates :cast, presence: true
    validates :language, presence: true
    validates :cover, presence: true

    has_many :reviews , dependent: :destroy

    has_many :movie_lists , dependent: :destroy
    has_many :lists , through: :movie_lists

    has_one_attached :cover_photo

end
