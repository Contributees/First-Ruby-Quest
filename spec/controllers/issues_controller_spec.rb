require "rails_helper"
RSpec.describe IssuesController, type: :controller do
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    context "without any additional params" do
      let!(:issue1) { create(:issue) }
      let!(:issue2) { create(:issue) }
      it "loads all of the issues into @issues" do
        get :index
        expect(assigns(:issues)).to match_array([issue1, issue2])
      end
    end

    context "when issues are filtered by assigned" do
      let!(:unassigned_issue) { create(:issue) }
      let!(:assigned_issue) { create(:issue, assigned: true) }

      context "when 'assigned' has been selected" do
        it "only returns assigned issues" do
          get :index, params: { issue: { assigned: true } }
          expect(assigns(:issues)).to match_array([assigned_issue])
        end
      end

      context "when 'unassigned' has been selected" do
        it "only returns unassigned issues" do
          get :index, params: { issue: { assigned: false } }
          expect(assigns(:issues)).to match_array([unassigned_issue])
        end
      end
    end

    context "when issues are filtered by category" do
      let!(:open_source_issue) { create(:issue) }
      let!(:call_to_action_issue) { create(:issue, category: "call_to_action") }

      context "when 'open-source' has been selected" do
        it "only returns open-source issues" do
          get :index, params: { issue: { category: "open-source" } }
          expect(assigns(:issues)).to match_array([open_source_issue])
        end
      end

      context "when 'call_to_action' has been selected" do
        it "only returns call_to_action issues" do
          get :index, params: { issue: { category: "call_to_action" } }
          expect(assigns(:issues)).to match_array([call_to_action_issue])
        end
      end
    end

    context "when issues are filtered by tags" do
      let(:tag1) { create(:tag) }
      let(:tag2) { create(:tag) }
      let(:tag3) { create(:tag) }
      let(:issue1) { create(:issue) }
      let!(:issue2) { create(:issue) }
      let!(:issue3) { create(:issue) }
      before do
        create(:issue_tag, issue: issue1, tag: tag1)
        create(:issue_tag, issue: issue2, tag: tag2)
        create(:issue_tag, issue: issue3, tag: tag3)
      end

      it "loads all the issues with tags" do
        get :index, params: { tags: "[{\"value\":\"#{tag1.id}\"},{\"value\":\"#{tag3.id}\"}]" }
        expect(assigns(:issues)).to match_array([issue1, issue3])
      end
    end

    # context "when issue are searched by keyword" do
    # end
  end

  # describe "#show" do
  # end

  # describe "#new" do
  # end

  # describe "#create" do
  # end
end
