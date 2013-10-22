FactoryGirl.define do
  factory :user do
  	sequence(:name) { |n| "Person #{n}" }
  	sequence(:email) { |n| "person_#{n}@example.com"}
  	password "foobar"
    password_confirmation "foobar"

    factory :admin do 
   		admin true
    end
  end
  factory :business, :class => Business, :parent => :user  do
    logo_url "http://www.lamole.com.br/portal/img/logo.png"
    description "This restaurant is the best in the city"
    type "Business"
  end
  
  factory :calendar do
  	start_date 1.hour.from_now
  	how_often 'weekly'
  	how_long '1 month'
  	user
    
    factory :calendar_with_items do 
      ignore do 
        calendar_items_count 3 
      end 
      after(:create) do 
        |calendar, evaluator| FactoryGirl.create_list(:calendar_item, evaluator.calendar_items_count, :calendar => calendar) 
      end 
    end
  end
  
  factory :action  do
    calendar
    command 'mandar email'
  end

  factory :calendar_item do
    calendar
    price 100.00
    quantity 20
    execution_date 1.day.from_now
    done false
  end

  factory :product do
    business
    price 10.00
    sequence(:name) { |n| "Product #{n}" }
    description "The best products ever"
    picture_url "http://www.caminodesantiago.me/wp-content/uploads/socks.png"
  end

end