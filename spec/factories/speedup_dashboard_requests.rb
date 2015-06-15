FactoryGirl.define do
  factory :speedup_dashboard_request, :class => 'SpeedupDashboard::Request' do

    request_uid { SecureRandom.uuid }
    time { Time.now - Random.rand(3600).minutes }
    duration 5
    controller "RandomController"
    action "random_action"
    path "random/random"
    view_duration 1.5
    db_duration 2.1

    trait :with_infos do
      transient do
        infos_count 10
      end

      after(:create) do |request, evaluator|
        create_list(:speedup_dashboard_context, evaluator.infos_count/4, request: request).each_with_index do |context, i|
          create_list(:speedup_dashboard_context_info, evaluator.infos_count/4, context: context)
          create_list(:speedup_dashboard_context_info, evaluator.infos_count%4, context: context) if i == 0
        end
      end
    end
  end

end
