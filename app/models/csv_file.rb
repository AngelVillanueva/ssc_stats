class CsvFile < ActiveRecord::Base
  has_attached_file :archivo,
    :path => ":rails_root/uploads/:class/:id/:basename.:extension"
  validates_attachment :archivo, content_type: { content_type: [ "text/csv" ] }

  rails_admin do
    edit do
      field :archivo do
        help I18n.t("activerecord.attributes.csv_file.archivo_help")
      end
    end
  end
end