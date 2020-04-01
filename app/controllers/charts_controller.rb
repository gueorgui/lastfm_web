class ChartsController < ApplicationController
  def index
  end

  def create
    @chart = ChartDecorator.new(Chart.new(chart_params))
  end

  private

  def chart_params
    permitted_params = %w[from_date from_time to_date to_time user]
    params.require(:chart).permit(permitted_params)
  end
end
