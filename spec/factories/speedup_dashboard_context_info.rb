FactoryGirl.define do
  factory :speedup_dashboard_context_info, :class => 'SpeedupDashboard::ContextInfo' do
    context { create(:speedup_dashboard_context) }
    description "MyString"
    duration 1.5
    data "MyText"
  end

end
