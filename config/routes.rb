Rails.application.routes.draw do

  # The index routes
  root 'neural_network#index'

  # The neural network comparing websites
  get  'neural_network/compare_websites'
  post 'neural_network/compare_websites_update'
  get  'neural_network/show_websites'

  # The neurual network trainning routes
  get  'neural_network/train'
  get 'neural_network/train_update'

end
