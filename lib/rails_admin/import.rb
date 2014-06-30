require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
 
module RailsAdminImport
end

# There are several options that you can set here. Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more info. 
module RailsAdmin
  module Config
    module Actions
      class Import < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :collection do
          true
        end
        register_instance_option :link_icon do
          'icon-upload'
        end
        register_instance_option :http_methods do
          [:get, :post]
        end
        register_instance_option :controller do
          Proc.new do
            if request.post?
              parametros = params[rails_admin.import_path.to_sym]
              modelo = parametros[:modelo]
              archivo = parametros[:archivo]
              c = CsvFile.new
              c.archivo = archivo
              c.modelo = modelo
              c.save!
            end
          end
        end
      end
    end
  end
end