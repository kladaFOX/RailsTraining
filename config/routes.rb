Rails.application.routes.draw do
  resources :groups do
    resources :students, shallow: true do
      resources :subject_marks, shallow: true, path: 'marks'
      member do
        get 'average_mark'
      end
    end
  end
end
