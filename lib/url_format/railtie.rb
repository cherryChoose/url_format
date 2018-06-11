module UrlFormat
 class Railtie < Rails::Railtie
   initializer "url_format.model_additions" do
      ActiveSupport.on_load :active_record do
      	extend ModelAdditions
      end	
   end
 end	
end