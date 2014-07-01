module ApplicationHelper
  def csv_headers_for model
    case model
      when "Compania" then
        entre_comillas I18n.t( "activerecord.attributes.compania.nombre" ).downcase
      else I18n.t( "errors.messages.undefined_csv_headers" )
    end
  end
end

def entre_comillas string
  "\"#{string}\""
end
