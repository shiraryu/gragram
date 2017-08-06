Rails.application.routes.draw do

  devise_for :users

  resources :pictures,only:[:index,:new,:create,:edit,:update,:destroy]do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine,at:'/letter_opener'
  end

  root'top#index'

end
