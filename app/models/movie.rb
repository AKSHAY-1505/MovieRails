class Movie < ApplicationRecord
    validates :name, presence: true 
    validates :director, presence: true
    validates :cast, presence: true
    validates :language, presence: true
    validates :cover, presence: true

    has_many :reviews
    has_and_belongs_to_many :lists
end
