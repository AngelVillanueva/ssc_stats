# == Schema Information
#
# Table name: companias
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Compania < ActiveRecord::Base
  has_many :precios
  has_many :episodios
  validates :nombre, presence: true
  validates_uniqueness_of :nombre, case_sensitive: false

  def self.create_from_import file_path
    resultado = {:creados => 0, :fallados => 0, :errors => []}
    creados = 0
    fallados = 0
    CSV.foreach( file_path, headers: true ) do |row|
      object = self.new row.to_hash
      if object.valid?
        object.save!
        creados = creados + 1
      else
        object.errors.messages.each do |k,v|
          resultado[:errors] << "#{k.to_s.titleize}: #{v.join(',')}"
        end
        fallados += 1
      end
    end
    resultado[:creados] = creados
    resultado[:fallados] = fallados
    resultado
  end

  rails_admin do
    edit do
      field :nombre
    end
  end
end
