module Alfredo
  class Workflow
    attr_accessor :items

    def initialize
      @items = []
    end

    def <<(item)
      @items << item if item.is_a? Alfredo::Item
    end

    alias_method :add, :<<

    def to_xml
      xml = Nokogiri::XML::Builder.new do |xml|
        xml.items
      end.doc

      items.each do |item|
        xml.xpath('/items').first.add_child(item.build_xml)
      end

      xml.to_s
    end

    def output!
      puts to_xml
    end
  end
end
