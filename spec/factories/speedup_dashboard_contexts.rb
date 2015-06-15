FactoryGirl.define do
  factory :speedup_dashboard_context, :class => 'SpeedupDashboard::Context' do
    sequence(:context_uid) {|n| n+1 }
    name { %w(request partials queries bullet) }
    association(:request, factory: :speedup_dashboard_request)
  end

end
