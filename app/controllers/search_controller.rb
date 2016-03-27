class SearchController < ApplicationController
  layout "search_with_map", :only => [:index]
  def index
    # @query = params['query']
    # @loc = params['loc']
    # return if @q.blank?
    # @q = "#{@query} #{@loc}"
    # @hits = User.search(@q, { hitsPerPage: 60, page: (params['page'] || 1) })
    
  end

end
