require 'spec_helper'
require 'html2record/orm/activerecord'

# Change this if MySQL is unavailable
  dbconfig = {
    :adapter  => 'mysql2',
	:database => 'html2record_test',
	:username => 'root',
	:encoding => 'utf8',
    :host => 'localhost'
  }

  ActiveRecord::Base.establish_connection(dbconfig)
  ActiveRecord::Migration.verbose = false


  class TestMigration < ActiveRecord::Migration
    def self.up
      create_table :goods, :force => true do |t|
        t.column :image, :string
        t.column :title, :string
        t.column :content, :text
        t.column :price, :double
      end
    end

    def self.down
      drop_table :goods
    end
  end
  

  class Good < ActiveRecord::Base
    include Html2record::ActiveRecord
  end

describe Html2record::ActiveRecord do 
  before(:all) do
    TestMigration.up
    class Taobao < Html2record::Parser::Base
      add :title,'#main .title'
      add :content,'#main .content'
    end
  end

  after(:all) { TestMigration.down }
  after { Good.delete_all }

  it 'apply_html should be mounted' do 
    Good.instance_methods.should include(:apply_html)   
  end


  it 'should accept html' do
      html =<<-page
        <html>
          <body>
            <div id="main">
              <div><span class="title">hello</span></div>
              <div><span class="content">world</span></div>
            </div>
          <body>
        </html>
      page
     
      good = Good.new 
      good.apply_html(Taobao,html)
      good.title.should eq 'hello'
  end

  it 'should accept block way' do 
    Taobao.class_eval do  
      add :image,'#main' do |doc|
        '123'
      end
    end

    html =<<-page
        <html>
          <body>
            <div id="main">
              <div><span class="title">hello</span></div>
              <div><span class="content">world</span></div>
            </div>
          <body>
        </html>
    page
 

    good = Good.new 
    good.apply_html(Taobao,html)
    good.image.should eq '123'
  end
end

