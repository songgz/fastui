# encoding: utf-8
module Fastui
  class ApplicationController < ActionController::Base


    # 分页方法
    def paginate(record_relation)
      limit = params[:limit].to_i
      start = params[:start].to_i
      @records = record_relation
      if limit != 0
        @records = record_relation.limit(limit).offset(start)
      end
      data ={
          :totalCount => record_relation.length,
          :rows => @records
      }
    end
  end
end
