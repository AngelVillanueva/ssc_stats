# load custom actions
require Rails.root.join('lib', 'rails_admin/import.rb')

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :usuario
  end
  config.current_user_method(&:current_usuario)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  # Label methods for model instances:
  config.label_methods << :nombre # Default is [:name, :title]
  config.label_methods << :concepto # Default is [:name, :title]
  config.label_methods << :descripcion # Default is [:name, :title]
  config.label_methods << :nombre_completo # Default is [:name, :title]

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    import do
      visible do
        # Make it visible only for selected models.
        bindings[:abstract_model].model.to_s.in? %w[ Compania Especialidad SubtipoCoste Usuario ]
      end
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
