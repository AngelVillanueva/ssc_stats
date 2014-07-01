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
              # create temporary CsvFile containing the data to be imported
              archivo = params[rails_admin.import_path.to_sym][:archivo]
              csv_file = CsvFile.new
              csv_file.archivo = archivo
              csv_file.save!
              # read data from imported file
              contador = 0
              CSV.foreach(csv_file.archivo.path, headers: true) do |row|
                if @model_name.constantize.create! row.to_hash
                  contador = contador + 1
                end
              end
              flash[:success] = "#{contador} creados"
              redirect_to back_or_index
            end
          end
        end
      end
    end
  end
end