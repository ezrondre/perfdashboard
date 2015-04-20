FactoryGirl.define do
  factory :perfdashboard_request, :class => 'Perfdashboard::Request' do
    request_id "MyString"
time "2015-04-12 22:20:40"
duration 1.5
controller "MyString"
action "MyString"
path "MyString"
view_duration 1.5
db_duration 1.5
  end

end
