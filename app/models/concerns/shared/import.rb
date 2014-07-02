module Shared::Import
  extend ActiveSupport::Concern

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods

    def create_from_import file_path
      # initial values for response array
      resultado = {:creados => 0, :fallados => 0, :errors => []}
      creados = 0
      fallados = 0
      # iterate through CSV file rows trying to create new records
      CSV.foreach( file_path, headers: true ) do |row|
        begin
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
        rescue StandardError => e
          resultado[:errors] << e
        end
      end
      # response including errors if any
      resultado[:creados] = creados
      resultado[:fallados] = fallados
      resultado
    end
  end

end