require 'spec_helper'

describe ActivitiesController do

  def valid_attributes
    {
      act_id: Factory(:act).id,
      user_id: Factory(:user).id,
      location_id: Factory(:location).id
    }  
  end

  describe "GET index" do
    it "assigns all activities as @activities" do
      activity = Factory(:activity)
      get :index
      assigns(:activities).should eq([activity])
    end
  end

  describe "GET show" do
    it "assigns the requested activity as @activity" do
      activity = Factory(:activity)
      get :show, :id => activity.id.to_s
      assigns(:activity).should eq(activity)
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      get :new
      assigns(:activity).should be_a_new(Activity)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity as @activity" do
      activity = Factory(:activity)
      get :edit, :id => activity.id.to_s
      assigns(:activity).should eq(activity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, :activity => valid_attributes
        }.to change(Activity, :count).by(1)
      end

      it "assigns a newly created activity as @activity" do
        post :create, :activity => valid_attributes
        assigns(:activity).should be_a(Activity)
        assigns(:activity).should be_persisted
      end

      it "redirects to the created activity" do
        post :create, :activity => valid_attributes
        response.should redirect_to(Activity.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested activity" do
        activity = Factory(:activity)
        Activity.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => activity.id, :activity => {'these' => 'params'}
      end

      it "assigns the requested activity as @activity" do
        activity = Factory(:activity)
        put :update, :id => activity.id, :activity => valid_attributes
        assigns(:activity).should eq(activity)
      end

      it "redirects to the activity" do
        activity = Factory(:activity)
        put :update, :id => activity.id, :activity => valid_attributes
        response.should redirect_to(activity)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      activity = Factory(:activity)
      expect {
        delete :destroy, :id => activity.id.to_s
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Factory(:activity)
      delete :destroy, :id => activity.id.to_s
      response.should redirect_to(activities_url)
    end
  end

end
