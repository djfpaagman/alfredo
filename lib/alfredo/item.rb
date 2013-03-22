module Alfredo
  class Item
    attr_accessor :title, :subtitle, :arg, :uid, :icon_path, :icon_type, :type

    def initialize(attributes = {})
      attributes.each do |attribute,value|
        send("#{attribute}=", value) if respond_to? "#{attribute}="
      end
    end

    def uid
      @uid || "#{title}_#{Time.now.to_i}"
    end

    def icon_type
      @icon_type || 'default'
    end
    
    def type
      @type || 'default'
    end

    def build_xml
      Nokogiri::XML::Builder.new do |xml|
        xml.item(arg: arg, uid: uid, valid: 'yes') {
          xml.title title
          xml.subtitle subtitle
          xml.icon(type: icon_type) {
            xml.text icon_path
          }
          xml.type type
        }
      end.doc.children.first
    end
  end
end
