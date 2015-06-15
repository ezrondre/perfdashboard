FactoryGirl.define do
  factory :speedup_dashboard_server, :class => 'SpeedupDashboard::Server' do
    sequence(:name) {|n| "Server #{n}"}
    host { name.underscore + '.test.com' }
  end

end
