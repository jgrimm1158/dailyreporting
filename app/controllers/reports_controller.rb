class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all
  end

  def show
  end

  def new
    @report = Report.new
  end

  
  def edit
  end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @report }
      else
        format.html { render action: 'new' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_report
      @report = Report.find(params[:id])
    end

    
    def report_params
      params[:report]
    end
end
