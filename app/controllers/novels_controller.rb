class NovelsController < ApplicationController
  # GET /novels
  # GET /novels.json
  def index
    @novels = Novel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @novels }
    end
  end

  # GET /more
  # Horrible abuse of Rails routes, I'm tired.
  def more
    respond_to do |format|
      format.html # more.html.erb
    end
  end

end
