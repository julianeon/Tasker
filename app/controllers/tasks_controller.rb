require 'timex'
require 'google_chart'

class TasksController < ApplicationController

  # GET /tasks
  # GET /tasks.json
  def index
    @date=Timex.date
    @tasks = Task.all
    @weekday=Timex.dayweek
    dayofyear=Timex.dayyear

    @thisday=Day.where(date: @date).first
    if @thisday.nil?
       daynew = Day.new(:date => @date, :name => @weekday, :yday => dayofyear)
       daynew.save
    end
    @thisday=Day.where(date: @date).first

    @dayhash=Hash.new
    days=Day.find(:all)
    days.each do |x|
      @dayhash[x.id]=x.date
      if x.date==Timex.date then @dayhash[x.id]="today" end
    end
    
    @taskfraction=GoogleChart::PieChart.new('700x400', "Task Hours", false) do |pc|
      t=Day.find_by_date(Timex.date)
      t.tasks.each do |x| 
        unless x.start.nil? || x.stop.nil?
          mins=x.stop-x.start
          unless x.content=="Break"
            color = "%06x" % (rand * 0xffffff)
          else
            color = '333333' 
          end
          pc.data x.content, mins, color 
        end
      end 
    pc.show_labels = true
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end

  end

  def today
    @date=Timex.date
    @thisday = Day.find_by_date(@date)
    @weekday=@thisday.name
    @tasks=Task.where(:day_id => @thisday.id)
    if @tasks.nil? 
      @tasks=Task.last
    end

    @taskfraction=GoogleChart::PieChart.new('700x400', "Task Hours", false) do |pc|
      @tasks.each do |x| 
        unless x.start.nil? || x.stop.nil?
          mins=x.stop-x.start
          unless x.content=="Break"
            color = "%06x" % (rand * 0xffffff)
          else
            color = '333333' 
          end
          pc.data x.content, mins, color 
        end
      end 
    pc.show_labels = true
    end

    respond_to do |format|
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    time=Time.new
    tdate=time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    @thisday=Day.find_by_date(tdate)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @weekday=Timex.dayweek
    @task = Task.find(params[:id])
  end

  # GET /tasks/1/start
  def start
    @timenow=Timex.stopwatch
    @task = Task.find(params[:id])
  end
  # GET /tasks/1/start

  def stop
    @timenow=Timex.stopwatch
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
