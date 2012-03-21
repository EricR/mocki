require './lib/mocki'

describe "mocki" do
  before :all do
    @resp = { :hello => :world }
  end

  it "should return JSON given a block" do
    mocki {@resp}.should == @resp.to_json
  end

  describe "records" do
    it "repeats the block" do
      mocki {2.records {@resp}}.should include 2.times.map {@resp}.to_json
    end
    it "increments an id with each cycle" do
      mocki {5.records {|id| {id: id} }}.should include "{\"id\":5}"
    end
  end
end
