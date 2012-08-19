#encoding: utf-8

module Html2record
  module Parser
    class Base
      attr_accessor :uri 
      
      class << self
        attr_accessor :parsers 
        def add(column,selector,&block)
          @parsers ||= Array.new
          @parsers << {:column=>column,:selector=>selector, :block=>block}
        end
      end

    end
  end
end

