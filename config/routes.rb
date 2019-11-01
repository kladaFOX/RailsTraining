Rails.application.routes.draw do
  concern :addressable do
    resources :adresses
  end

  resources :groups do
    resources :students, shallow: true, concerns: :addressable do
      resources :subject_marks, shallow: true, path: 'marks'
      resources :student_cards, shallow: true, only: [:new, :show, :create, :update, :destroy, :edit]
      member do
        get 'average_mark'
      end
    end
  end
  resources :universities, concerns: :addressable
  resources :subjects do
    resources :lecturers, shallow: true, only: [:new, :show, :create, :update, :destroy, :edit]
  end
  get 'lecturers', to: 'lecturers#index'
end
