FactoryGirl.define do
  factory :perfdashboard_context_datum, :class => 'Perfdashboard::ContextDatum' do
    context nil
description "MyString"
duration 1.5
data "MyText"
  end

end
