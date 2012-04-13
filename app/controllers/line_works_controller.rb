class LineWorksController < ApplicationController
  # GET /line_works
  # GET /line_works.json
  def index
    @line_works = LineWork.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_works }
    end
  end

  # GET /line_works/1
  # GET /line_works/1.json
  def show
    @line_work = LineWork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_work }
    end
  end

  # GET /line_works/new
  # GET /line_works/new.json
  def new
    @line_work = LineWork.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_work }
    end
  end

  # GET /line_works/1/edit
  def edit
    @line_work = LineWork.find(params[:id])
  end

  # POST /line_works
  # POST /line_works.json
  def create
    @portfolio = current_portfolio
    pattern = Pattern.find(params[:pattern_id])
    @line_work = @portfolio.line_works.build(:pattern => pattern)    

    respond_to do |format|
      if @line_work.save
        reset_counter
        format.html { redirect_to  @line_work.portfolio, :notice => 'Line work was successfully created.' }
        format.json { render json: @line_work, status: :created, location: @line_work }
      else
        format.html { render action: "new" }
        format.json { render json: @line_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_works/1
  # PUT /line_works/1.json
  def update
    @line_work = LineWork.find(params[:id])

    respond_to do |format|
      if @line_work.update_attributes(params[:line_work])
        format.html { redirect_to @line_work, notice: 'Line work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_works/1
  # DELETE /line_works/1.json
  def destroy
    @line_work = LineWork.find(params[:id])
    @line_work.destroy

    respond_to do |format|
      format.html { redirect_to line_works_url }
      format.json { head :no_content }
    end
  end
end
