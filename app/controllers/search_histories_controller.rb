class SearchHistoriesController < ApplicationController
  # index, show以外は外部からは呼び出されないはず
  load_and_authorize_resource

  # GET /search_histories
  # GET /search_histories.xml
  def index
    if params[:mode] == 'not_found'
      if current_user.has_role?('Administrator')
        @search_histories = SearchHistory.not_found.order('created_at DESC').page(params[:page])
      else
        @search_histories = current_user.search_histories.not_found.order('created_at DESC').page(params[:page])
      end
    else
      if current_user.has_role?('Administrator')
        @search_histories = SearchHistory.order('created_at DESC').page(params[:page])
      else
        @search_histories = current_user.search_histories.order('created_at DESC').page(params[:page])
      end
    end

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @search_histories.to_xml }
    end
  end

  # GET /search_histories/1
  # GET /search_histories/1.xml
  def show
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @search_history.to_xml }
    end
  end

  # DELETE /search_histories/1
  # DELETE /search_histories/1.xml
  def destroy
    @search_history.destroy

    respond_to do |format|
      #format.html { redirect_to user_search_histories_url(@user) }
      format.html { redirect_to search_histories_url }
      format.xml  { head :ok }
    end
  end
end
