require 'alfredo'

describe 'Alfredo::Workflow' do
  before do
    @workflow = Alfredo::Workflow.new
    3.times do
      @workflow.items << Alfredo::Item.new(:title => rand(9999))
    end
  end

  describe "#<<" do
    it "should add Alfredo::Item" do
      item = Alfredo::Item.new
      
      @workflow << item
      @workflow.items.should include(item)
    end

    it "should not add a random thing" do
      item = 'foo'

      @workflow << item
      @workflow.items.should_not include(item)
    end
  end
  
  describe "#add" do
    it "should be an alias for <<" do
      @workflow.method(:add).should eq(@workflow.method(:<<))
    end
  end

  describe "#to_xml" do
    before do
      @xml = Nokogiri::XML.parse(@workflow.to_xml)
    end

    it "should return valid XML" do
      @xml.should be_an_instance_of(Nokogiri::XML::Document)
    end

    it "should have an <items> root" do
      @xml.xpath('/items').size.should eq 1
    end

    it "should have an <item> per item in Workflow" do
      @xml.xpath('/items/item').size.should eq @workflow.items.size 
    end
  end

  describe "#output!" do
    it "should output XML to the STDOUT" do
      pending "Can't get the $stdout thing to work in 1.8.7"
      # $stdout.should_receive(:puts).with(@workflow.to_xml)
      # @workflow.output!
    end
  end
end
