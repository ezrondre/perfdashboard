FactoryGirl.define do
  factory :speedup_dashboard_context_datum, :class => 'SpeedupDashboard::ContextDatum' do
    context nil
description "MyString"
duration 1.5
data "MyText"
  end

end
