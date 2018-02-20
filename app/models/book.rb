class Book < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    belongs_to :category
    belongs_to :auteur
    scope :published, -> { where(online: true) }

    def self.search(search)
        where("title LIKE ?", "%#{search}%").or(where("text LIKE ?", "%#{search}%"))
    end
end