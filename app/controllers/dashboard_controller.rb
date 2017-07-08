class DashboardController < ApplicationController
  def index
    data = YAML.load_file(Rails.root.join('config', 'data.yml'))
    month = Date.today.month
    @plants = data['plants'].select do |plant_name, plant_data|
      plant_data['planting_period']['start'] <= month && plant_data['planting_period']['end'] >= month
    end
  end
end