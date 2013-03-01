module Fastui
  class ApplicationController < ActionController::Base


    # 分页方法
    def paginate(entities)
      limit = params[:limit].to_i
      start = params[:start].to_i
      if entities.all.class.eql?(Array)
        @records = entities.limit(limit).offset(start)
        data ={
            :totalCount => entities.all.length,
          :rows => @records
        }
      else
        @records = entities.limit(limit).offset(start)
        data ={
            :totalCount => entities.length,
            :rows => @records
        }
      end
      data
    end
  end
end
