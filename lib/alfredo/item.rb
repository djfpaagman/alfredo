module Alfredo
  class Item
    attr_accessor :title, :subtitle, :arg, :uid, :icon_path, :icon_type, :type, :valid, :autocomplete

    def initialize(attributes = {})
      attributes.each do |attribute,value|
        send("#{attribute}=", value) if respond_to? "#{attribute}="
      end
    end

    def uid
      @uid || title
    end

    def icon_type
      @icon_type if %w{fileicon filetype}.include? @icon_type
    end
    
    def valid
      if @valid == false
        'no'
      else
        'yes'
      end
    end

    def autocomplete
      @autocomplete || title
    end

    def type
      @type if @type == 'file'
    end

    def build_xml
      Nokogiri::XML::Builder.new do |xml|
        xml.item(:arg => arg, :uid => uid, :valid => valid, :autocomplete => autocomplete) {
          xml.title title
          xml.subtitle subtitle
          if icon_path
            if icon_type
              xml.icon(:type => icon_type) {
                xml.text icon_path
              }
            else
              xml.icon icon_path
            end
          end
          xml.type_ type if type
        }
      end.doc.children.first
    end
  end
end
