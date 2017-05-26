# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  position    :integer
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  validates :title, presence: true
  # validates :image, presence: true

  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  has_many :photos
  accepts_nested_attributes_for :photos

  belongs_to :category


end
