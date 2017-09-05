class Contact < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones
  belongs_to :user

  validates :name, presence: true
  validates :website, format: { with: URI::regexp(%w(http https)), message: "website http veya https ile başlamalıdır."}
  validates :gender, inclusion: { in: %w(Kadın Erkek Diğer) }, presence: true
  validates :user_id, presence: true


  def fullname
    name = self.name.humanize + " " + self.surname.upcase
    if name.size < 19
      name
    else
      name[0..19] + "..."
    end

  end

  def age
    birthday = self.birthday
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
  def remaining_days
    birthday = self.birthday.yday
    now = Time.now.utc.to_date.yday
    now < birthday ? birthday - now : (Date.new(Time.now.year + 1,12,31).yday - now) + birthday
  end

end
