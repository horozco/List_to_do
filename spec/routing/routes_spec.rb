require "spec_helper"

describe "Routes Helpers" do
  
  it "routes root (/) to lists#index" do
    get("/").should route_to("lists#index")
  end
  
end