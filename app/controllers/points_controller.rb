# coding: utf-8

class PointsController < ApplicationController
  # GET /points
  # GET /points.json
  def index
    @points = Point.all

    respond_to do |format|
      format.json { render json: @points, :except => [:address, :created_at, :updated_at] }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    @page_name = "Lokasyon #" + params[:id] + " | "
    @page_description = "Yetenek noktası"

    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point, :except => [:address, :created_at, :updated_at] }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new
    @page_name = "Yetenek ekle | "
    @page_description = "Yeni yetenek ekle"
    @wrapped = true

    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(params[:point])
    @point.user_uid = current_user.uid
    skill_ids = params[:point_skils][:ids]
    puts "skill_ids: #{skill_ids}"
    skill_list = skill_ids.select(&:present?).join(",")
    @point.tag_list.add(skill_list)
    current_user.skill_list = skill_list

    respond_to do |format|
      if @point.save && current_user.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
      else
        format.html { redirect_to :add }
      end
    end
  end

  # POST /report.json
  def report
    if Point.where(id: params[:point_id].to_i).any?
      @r = Report.new()
      @r.point_id = params[:point_id].to_i
      @r.user_uid = current_user.uid

      respond_to do |format|
        if @r.save
          format.json { render :json => { :status => 'success' } }
        else
          format.json { render :json => { :status => 'fail' } }
        end
      end

    else

      respond_to do |format|
        format.json { render :json => { :status => 'error' } }
      end

    end
  end

end