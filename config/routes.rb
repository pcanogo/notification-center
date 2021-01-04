Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :notifications, path: '/admin/notifications', only: [:index, :show, :create], module: "admin" do
          post 'clients', to: 'notifications#clients' , on: :collection
      end

      resources :users, only: [] do
        resources :notifications, only: [:index, :show, :update ]
      end

    end
  end
end
