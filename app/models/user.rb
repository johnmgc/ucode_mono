class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :publish
has_many :comment


validates :nickname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50, minimum: 5}


end

