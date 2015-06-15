FactoryGirl.define do
  factory :speedup_dashboard_context_info, :class => 'SpeedupDashboard::ContextInfo' do
    association(:context, factory: :speedup_dashboard_context)
    description "Random action"
    duration 1.5
    data "MyText"
  end

end
