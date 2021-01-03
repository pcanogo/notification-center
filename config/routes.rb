Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :notifications, path: '/admin/notifications', only: [:index, :show, :create], module: "admin" do
          post 'clients', to: 'notifications#clients' , on: :collection
      end

      resources :notifications, only: [:index, :show, :patch ]

    end
  end
end
