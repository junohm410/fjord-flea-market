# frozen_string_literal: true

class PurchaseRequest < ApplicationRecord
  belongs_to :user
  belongs_to :item, counter_cache: true

  validates :user, presence: true, uniqueness: { scope: :item }
  validates :item, presence: true
end
