# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name
  VALID_REGEX = /\w+|[а-яА-Я]+/
  validates :name,  presence: true, length: { maximum: 20 },
  									format: { with: VALID_REGEX }

  has_ancestry
end
