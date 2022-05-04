Rails.application.routes.draw do
  get 'performances/index'
  root to: "performances#new"
end
