# == Schema Information
#
# Table name: csv_files
#
#  id                   :integer          not null, primary key
#  archivo_file_name    :string(255)
#  archivo_content_type :string(255)
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#  modelo               :string(255)
#

class CsvFile < ActiveRecord::Base
  has_attached_file :archivo,
    :path => ":rails_root/uploads/:class/:id/:basename.:extension"
  validates :modelo, presence: true
  validates_attachment :archivo, presence: true,
    content_type: { content_type: ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain'] }

  def modelo_enum
    [
      I18n.t("activerecord.models.compania"),
      I18n.t("activerecord.models.especialidad"),
      I18n.t("activerecord.models.medico"),
    ]
  end

  rails_admin do
    list do
      configure :archivo do
        pretty_value do
          bindings[:object].archivo_file_name
        end
      end
    end
    edit do
      field :modelo
      field :archivo do
        help I18n.t("activerecord.attributes.csv_file.archivo_help")
      end
    end
  end
end
