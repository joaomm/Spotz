require 'spec_helper'

describe ActsController do

  def valid_attributes
    { name: "A valid name" }
  end
  
  def mock_act(stubs={})
    @mock_act ||= mock_model(Act, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all acts as @acts" do
      act = Act.create! valid_attributes
      get :index
      assigns(:acts).should eq([act])
    end
  end

  describe "GET show" do
    it "assigns the requested act as @act" do
      act = Factory :act
      get :show, :id => act.id.to_s
      assigns(:act).should eq(act)
    end
  end

  describe "GET new" do
    it "assigns a new act as @act" do
      get :new
      assigns(:act).should be_a_new(Act)
    end
  end

  describe "GET edit" do
    it "assigns the requested act as @act" do
      act = Factory :act
      get :edit, :id => act.id.to_s
      assigns(:act).should eq(act)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Act" do
        expect {
          post :create, :act => valid_attributes
        }.to change(Act, :count).by(1)
      end

      it "assigns a newly created act as @act" do
        post :create, :act => valid_attributes
        assigns(:act).should be_a(Act)
        assigns(:act).should be_persisted
      end

      it "redirects to the created act" do
        post :create, :act => valid_attributes
        response.should redirect_to(Act.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved act as @act" do
        # Trigger the behavior that occurs when invalid params are submitted
        Act.any_instance.stub(:save).and_return(false)
        post :create, :act => {}
        assigns(:act).should be_a_new(Act)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Act.any_instance.stub(:save).and_return(false)
        post :create, :act => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested act" do
        act = Factory :act
        # Assuming there are no other acts in the database, this
        # specifies that the Act created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Act.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => act.id, :act => {'these' => 'params'}
      end

      it "assigns the requested act as @act" do
        act = Factory :act
        put :update, :id => act.id, :act => valid_attributes
        assigns(:act).should eq(act)
      end

      it "redirects to the act" do
        act = Factory :act
        put :update, :id => act.id, :act => valid_attributes
        response.should redirect_to(act)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested act" do
      act = Factory :act
      expect {
        delete :destroy, :id => act.id.to_s
      }.to change(Act, :count).by(-1)
    end

    it "redirects to the acts list" do
      act = Factory :act
      delete :destroy, :id => act.id.to_s
      response.should redirect_to(acts_url)
    end
  end

end
