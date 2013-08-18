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
  factory :calendar do
  	start_date 1.hour.from_now
  	how_often 'everyday'
  	how_long '1year'
  	user
  end
  
  factory :calendar_item do
    execution_date 1.day.from_now
    done false
    calendar
  end
  
  factory :action do
    command 'mandar email'
    calendar
  end
  
end