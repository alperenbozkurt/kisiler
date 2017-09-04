class Phone < ApplicationRecord
  belongs_to :contact
  validates :phone, presence: true
end
