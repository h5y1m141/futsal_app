 FutsalApp::Application.routes.draw do
   root  to: 'places#index'

   controller :static_pages do
     get :about, :contact, :news, :ochiai, :toshimaen, :nerima
   end

   resources :places do
     member do
       get :search, :followers
     end
   end
end
