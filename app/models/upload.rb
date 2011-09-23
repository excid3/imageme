class Upload < ActiveRecord::Base
  acts_as_taggable
  after_initialize :init
  belongs_to :user
  has_attached_file :image, :styles => { :thumb => "100x100>" }

  attr_accessible :image, :tag_list

  private

  def init
    self.views ||= 0
  end
end
