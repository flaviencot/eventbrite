class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: 'User'
    #validates :start_date, presence: true
    #validates :duration, presence: true
    validates :title, presence: true
    validates :price, presence: true
end