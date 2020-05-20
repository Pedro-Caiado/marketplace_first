class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  enum status: {
    opened: 0,
    finished: 1
  }

  def finish!
    self.status = 1
    self.value = self.products.sum(&:price)
    save!
  end
end
