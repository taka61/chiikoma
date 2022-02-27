# frozen_string_literal: true

json.set! :hassles do
  json.array! @hassles do |hassle|
    json.extract! hassle, :id, :title, :difficulty_levels, :frequency, :cost, :total_points
  end
end
