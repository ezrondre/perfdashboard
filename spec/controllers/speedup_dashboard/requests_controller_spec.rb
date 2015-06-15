require 'rails_helper'

module SpeedupDashboard
  describe RequestsController, type: :controller do
    routes { SpeedupDashboard::Engine.routes }

    let(:server) { FactoryGirl.create(:speedup_dashboard_server) }

    describe '#create' do
      let(:request_data) do
        {
          request_id: SecureRandom.uuid,
          contexts: ["queries","request"],
          data: {
            request:  {time: "2015-06-15T19:45:33.490+02:00",duration: 24.962991,controller: "WelcomeController",action: "index",path: "/",view_duration: 23.754211005770706,db_duration: 0.719012},
            queries: [
              {time: "2015-06-15T19:45:33.492+02:00", duration: 0.637085, name: "User Load", query: "SELECT \"users\".* FROM \"users\""},
              {time: "2015-06-15T19:45:33.494+02:00", duration: 0.191036, name: nil, query: "SELECT COUNT(*) FROM \"posts\" WHERE \"posts\".\"author_id\" = ?"},
              {time: "2015-06-15T19:45:33.495+02:00",duration: 0.110414,name: nil,query: "SELECT COUNT(*) FROM \"posts\" WHERE \"posts\".\"author_id\" = ?"},
              {time: "2015-06-15T19:45:33.496+02:00",duration: 0.11495899999999999,name: nil,query: "SELECT COUNT(*) FROM \"posts\" WHERE \"posts\".\"author_id\" = ?"}
            ],
          }
        }
      end

      before(:each) do
        request.headers['X-Sur-Api-Key'] = server.api_key
      end

      it 'create request for server' do
        post :create, request_data.merge(format: :json)
        expect( SpeedupDashboard::Request.count ).to eq( 1 )
        expect( SpeedupDashboard::Request.first.contexts.pluck(:name) ).to include('queries')
        expect( SpeedupDashboard::Request.first.contexts.first.context_infos.count ).to eq(4)
      end
    end

    describe '#index' do
      let(:data) { FactoryGirl.create_list(:speedup_dashboard_request, 4, :with_infos) }

      it 'finds requests' do
        data
        get :index
        expect( assigns(:requests).count ).to eq( 4 )
      end

      context 'with rendering a views' do
        render_views

        subject { data; get :index }

        specify { should render_template(:index) }
      end

    end

  end
end
