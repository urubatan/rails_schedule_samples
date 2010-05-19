class SampleTasksController < ApplicationController
  # GET /sample_tasks
  # GET /sample_tasks.xml
  def index
    @sample_tasks = SampleTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sample_tasks }
    end
  end

  # GET /sample_tasks/1
  # GET /sample_tasks/1.xml
  def show
    @sample_task = SampleTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sample_task }
    end
  end

  # GET /sample_tasks/new
  # GET /sample_tasks/new.xml
  def new
    @sample_task = SampleTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sample_task }
    end
  end

  # GET /sample_tasks/1/edit
  def edit
    @sample_task = SampleTask.find(params[:id])
  end

  # POST /sample_tasks
  # POST /sample_tasks.xml
  def create
    @sample_task = SampleTask.new(params[:sample_task])

    respond_to do |format|
      if @sample_task.save
        format.html { redirect_to(@sample_task, :notice => 'Sample task was successfully created.') }
        format.xml  { render :xml => @sample_task, :status => :created, :location => @sample_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sample_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sample_tasks/1
  # PUT /sample_tasks/1.xml
  def update
    @sample_task = SampleTask.find(params[:id])

    respond_to do |format|
      if @sample_task.update_attributes(params[:sample_task])
        format.html { redirect_to(@sample_task, :notice => 'Sample task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sample_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_tasks/1
  # DELETE /sample_tasks/1.xml
  def destroy
    @sample_task = SampleTask.find(params[:id])
    @sample_task.destroy

    respond_to do |format|
      format.html { redirect_to(sample_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
