class Product < ApplicationRecord
    has_one_attached :image
end

private

def not_referenced_by_any_line_item
    unless line_items.empty?
        errors.add(:base, 'line item present')
        throw :abort
    end
end

