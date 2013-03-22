require 'alfredo'

describe 'Alfredo::Item' do
  describe '#build_xml' do
    before do
      @item = Alfredo::Item.new(title: 'foo', subtitle: 'bar', arg: 'baz', uid: 123, icon_path: 'icon.png', icon_type: 'fileicon', type: 'file')

      @xml = @item.build_xml
    end

    it 'should set title' do
      @xml.xpath('/item/title').first.text.should eq 'foo'
    end

    it 'should set subtitle' do
      @xml.xpath('/item/subtitle').first.text.should eq 'bar'
    end

    it 'should set arg' do
      @xml.xpath('/item/@arg').first.text.should eq 'baz'
    end

    it 'should set uid' do
      @xml.xpath('/item/@uid').first.text.should eq '123'
    end

    it 'should generate uid when not set' do
      @item.uid = nil
      @item.build_xml.xpath('/item/@uid').first.text.should match /#{@item.title}_[0-9]+/
    end

    it 'should set icon_path' do
      @xml.xpath('/item/icon').first.text.should eq 'icon.png'
    end

    it 'should set icon_type' do
      @xml.xpath('/item/icon/@type').first.text.should eq 'fileicon'
    end

    it 'should use default icon_type when not set' do
      @item.icon_type = nil
      @item.build_xml.xpath('/item/icon/@type').first.text.should eq 'default'
    end

    it 'should set type' do
      @xml.xpath('/item/type').first.text.should eq 'file'
    end

    it 'should use default type when not set' do
      @item.type = nil
      @item.build_xml.xpath('/item/type').first.text.should eq 'default'
    end
  end
end

