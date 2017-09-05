class Phone < ApplicationRecord
  belongs_to :contact
  validates :phone, presence: true

  def humanize
    phone = self.phone
    if phone.size == 11 && phone[0] = "0"
      phone[0..3] + " " + phone[4..6] + " " + phone[7..10]
    end
  end
end
