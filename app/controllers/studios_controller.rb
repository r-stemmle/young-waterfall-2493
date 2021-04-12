class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @actors_by_oldest_first = @studio.actors.oldest_first
    @active_studio_actors = @actors_by_oldest_first.active
  end
end
