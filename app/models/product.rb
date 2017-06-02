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
  is_impressionable


  validates :title, presence: true
  #折扣
  validates_numericality_of :discount, :greater_than => 0, :less_than => 100, :allow_blank => true

  # validates :image, presence: true

  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  has_many :photos
  accepts_nested_attributes_for :photos

  belongs_to :category
  has_many :reviews

  # Scope #
  scope :recent, -> { order('created_at DESC') }
  scope :published, -> { where(is_hidden: false)}
  scope :random5, -> {limit(5).order("RANDOM()")}

  # 管理员上下架商品
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
   self.is_hidden = true
   self.save
  end

end
