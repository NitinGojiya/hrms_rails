class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :profile, dependent: :destroy
  # has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_user_id"
   has_many :leaves, class_name: "Leafe"
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }, if: :validate_password?
  private
  def validate_password?
    new_record? || !password.nil?
  end
end
