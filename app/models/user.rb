class User < ApplicationRecord
  has_secure_password

  scope :admin, -> { where(role: 1) }
  scope :user, -> { where(role: 0) }
  # enum :role, [ :user, :admin ]
  has_many :sessions, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :salary, dependent: :destroy
  # has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_user_id"
  has_many :leaves, class_name: "Leave"
  has_one_attached :profile_photo

  # validatation
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }, if: :validate_password?
  before_create :method_to_set_username

  private
  def validate_password?
    new_record? || !password.nil?
  end

  def method_to_set_username
    if email_address.present?
      self.username = email_address.split("@").first + rand(100).to_s
    else
      self.username = "user_#{SecureRandom.hex(4)}"
    end
  end
end
