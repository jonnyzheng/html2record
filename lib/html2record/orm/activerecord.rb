# encoding: utf-8
require 'active_record'
require 'nokogiri'

module Html2record
  module ActiveRecord
    def apply_html(paser_class,html,&block)
      doc = Nokogiri::HTML.parse(html)
      paser_class.parsers.each do |x|
        column =  x[:column]
        selector = x[:selector]
        xblock = x[:block]
        content= ''
        
        element = doc.css(selector)        
        if xblock.nil?
          element = element.first if element.kind_of?(Array) 
          content = element.text
        else
          content = xblock.call(element) 
        end
        write_attribute(column,content)
      end
    end
  end
end

