# frozen_string_literal: true

module Hecms
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
    devise :database_authenticatable,
           :recoverable, :rememberable, :validatable
  end
end
