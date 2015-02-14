RSpec.describe PlacesController, type: :routing do
  describe 'Routing' do
    it_routes_to(:get, '/', 'places#index')
  end
end

RSpec.describe StaticPagesController, type: :routing do
  describe 'Routing' do
    it_routes_to(:get, '/about', 'static_pages#about')
    it_routes_to(:get, '/contact', 'static_pages#contact')
    it_routes_to(:get, '/news', 'static_pages#news')
    it_routes_to(:get, '/ochiai', 'static_pages#ochiai')
    it_routes_to(:get, '/toshimaen', 'static_pages#toshimaen')
    it_routes_to(:get, '/nerima', 'static_pages#nerima')
  end
end
