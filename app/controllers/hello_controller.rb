# coding: utf-8

class HelloController < ApplicationController

  def index
    @page_name = "Yetenek haritası | "
    @page_description = ""
    @wrapped = true
  end

  def map
    @page_name = "Harita | "
    @page_description = ""
  end

  def about
    @page_name = "Nedir | "
    @page_description = ""
    @wrapped = true
  end
  
end