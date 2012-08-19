module Html2record
  autoload :ActiveRecord, 'html2record/orm/activerecord'
  autoload :Parser,'html2record/parser'
end

if defined?(Rails)
  module Html2record
    class Railtie < Rails::Railtie
      initializer "html2record.record" do
        ActiveSupport.on_load :action_controller do

        end
      end
    end
  end  

end
