Rails.application.routes.draw do

  # The index routes
  root 'neural_network#index'

  # The neural network comparing websites
  get  'neural_network/compare_websites'
  post 'neural_network/compare_websites_update'

  # The neurual network trainning routes
  get  'neural_network/train'
  post 'neural_network/train_update'

end
