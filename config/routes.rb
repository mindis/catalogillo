Catalogillo::Engine.routes.draw do

  #api_version(:module => "api", :path => {:value => "api/v1/catalog"}) do
  #  match '/update' => 'v1/categories#update', :via => :post
  #end

  match "/api/v1/products/index" => 'api/v1/products#index', via: :post
  match "/api/v1/products/destroy/:id" => 'api/v1/products#destroy', via: :delete

  match "/api/v1/categories/index" => 'api/v1/categories#index', via: :post
  match "/api/v1/categories/destroy/:id" => 'api/v1/categories#destroy', via: :delete

  match "/api/v1/dynamic_categories/index" => 'api/v1/dynamic_categories#index', via: :post

  match "/search/(:keyword)" => 'categories#search', via: :get, as: 'catalogillo_search'
  match "/:slug" => 'categories#index', via: :get, as: 'catalogillo_index'
  match "/product/:id(.format)" => 'products#show', via: :get, as: 'catalogillo_product'
end
