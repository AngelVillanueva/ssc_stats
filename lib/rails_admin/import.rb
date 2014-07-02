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
            # if a file is uploaded try to create a temp CsvFile from it
            if request.post?
              begin
                csv_file = CsvFile.create! archivo: params[rails_admin.import_path.to_sym][:archivo]
              rescue StandardError => e
                flash[:error] = e
              end
              # create records from valid file and return the number of created records
              if csv_file
                importacion = @abstract_model.model.create_from_import( csv_file.archivo.path )
                flash[:success] = I18n.t( "exitos.messages.created_records", records: importacion[:creados] )
                unless importacion[:errors].empty?
                  if importacion[:fallados] > 0
                    error_message = I18n.t( "errors.messages.created_records", records: importacion[:fallados] )
                  else
                    error_message = I18n.t( "errors.messages.no_created_records" )
                  end
                  flash[:error] = error_message
                  flash[:notice] = importacion[:errors].join(" -- ")
                end
              end
              redirect_to back_or_index
            end
          end
        end
      end
    end
  end
end