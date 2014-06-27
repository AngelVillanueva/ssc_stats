class CsvFile < ActiveRecord::Base
  has_attached_file :archivo,
    :path => ":rails_root/uploads/:class/:id/:basename.:extension"
  validates_attachment :archivo, presence: true,
    content_type: { content_type: ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain'] }

  rails_admin do
    edit do
      field :archivo do
        help I18n.t("activerecord.attributes.csv_file.archivo_help")
      end
    end
  end
end