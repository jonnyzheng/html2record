require 'spec_helper'
require 'html2record/parser'

describe Html2record::Parser::Base do

  before(:all) do
    class Taobao < Html2record::Parser::Base
      add :title, 'selector' 
      add :content, 'selector'
    end

    @parser = Taobao.new
  end

end
