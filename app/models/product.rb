class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :user

    validates :title, presence: true
    validate :image_content_type

    private

    def image_content_type
        if image.attached? && !image.content_type.in?(%w(image/png image/jpeg))
            errors.add(:document, 'Must be a PNG or a JPEG file')
        end
    end
end
