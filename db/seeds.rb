# frozen_string_literal: true

require 'active_record/fixtures'

tables = %i[
  users
  chiikomas
]

tables.each do |table|
  ActiveRecord::FixtureSet.create_fixtures 'db/fixtures', table
end
