class Contact < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :name, :email, :message
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10 }
end
