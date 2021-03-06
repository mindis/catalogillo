module Catalogillo
  module Api
    module V1
      class DynamicCategoriesController < ApplicationController

        def index
          search_query = params[:dynamic_category].delete(:search_query)
          sorting_options = params[:dynamic_category].delete(:sorting_options)
          category = DynamicCategory.new params[:dynamic_category].merge(search_query: ActiveSupport::JSON.encode(search_query), sorting_options: ActiveSupport::JSON.encode(sorting_options))
          category.index
          head Sunspot.commit ? :ok : :unprocessable_entity
        end

      end
    end
  end
end
