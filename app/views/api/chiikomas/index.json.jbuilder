# frozen_string_literal: true

json.set! :chiikomas do
  json.array! @chiikomas do |chiikoma|
    json.extract! chiikoma, :id, :title, :level_of_problem, :frequency_of_experience, :cost_of_solution, :total_points
  end
end
