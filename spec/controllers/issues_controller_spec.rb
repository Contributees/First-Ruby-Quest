require "rails_helper"
RSpec.describe IssuesController, type: :controller do
  describe "#index" do
    let!(:issue1) { create(:issue) }
    let!(:issue2) { create(:issue) }

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    context "without any additional params" do
      it "loads all of the issues into @issues" do
        get :index
        expect(assigns(:issues)).to match_array([issue1, issue2])
      end
    end
  end

  # describe "#show" do
  # end

  # describe "#new" do
  # end

  # describe "#create" do
  # end
end
