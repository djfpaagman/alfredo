require 'alfredo'

describe 'Alfredo::Item' do
  describe '#build_xml' do
    before do
      @item = Alfredo::Item.new(:title => 'foo',
                                :subtitle => 'bar',
                                :arg => 'baz',
                                :uid => 123,
                                :icon_path => 'icon.png',
                                :icon_type => 'fileicon',
                                :type => 'file',
                                :autocomplete => 'moo')

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

    it 'should set uid to title when uid not set' do
      @item.uid = nil
      @item.build_xml.xpath('/item/@uid').first.text.should eq @item.title
    end

    it 'should set icon to icon_path' do
      @xml.xpath('/item/icon').first.text.should eq 'icon.png'
    end

    it 'should set icon to icon_path without icon_type' do
      @item.icon_type = nil
      @item.build_xml.xpath('/item/icon').first.text.should eq 'icon.png'
    end

    it 'should not set icon when no icon_path not present' do
      @item.icon_path = nil
      @item.build_xml.xpath('/item/icon').size.should eq 0
    end

    it 'should set icon_type for fileicon' do
      @xml.xpath('/item/icon/@type').first.text.should eq 'fileicon'
    end

    it 'should set icon_type for filetype' do
      @item.icon_type = 'filetype'
      @item.build_xml.xpath('/item/icon/@type').first.text.should eq 'filetype'
    end

    it 'should not set icon_type when invalid' do
      @item.icon_type = nil
      @item.build_xml.xpath('/item/icon/@type').size.should eq 0
    end

    it 'should set type only when its file' do
      @xml.xpath('/item/type').first.text.should eq 'file'
    end

    it 'should not set type when its invalid' do
      @item.type = 'foo'
      @item.build_xml.xpath('/item/type').size.should eq 0
    end

    it 'should set valid to yes by default' do
      @xml.xpath('/item/@valid').first.text.should eq 'yes'
    end

    it 'should set valid to no if its false' do
      @item.valid = false
      @item.build_xml.xpath('/item/@valid').first.text.should eq 'no'
    end

    it 'should set autocomplete' do
      @xml.xpath('/item/@autocomplete').first.text.should eq 'moo'
    end
  end
end

