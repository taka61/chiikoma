# frozen_string_literal: true

class Hassle < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :difficulty_levels, presence: true
  validates :frequency, presence: true
  validates :cost, presence: true

  scope :this_week, -> { where(created_at: Time.current.all_week) }

  scope :solved_on_this_week, -> { where(solved_on: Time.current.all_week) }
end
