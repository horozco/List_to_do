FactoryGirl.define do

  factory :list do
    title "example list title"

    factory :invalid_event do
        title ""
    end
  end

  factory :task do
    title_task "example task title"
    status false

    factory :invalid_task do
        title_task ""
        status true
    end
  end

end