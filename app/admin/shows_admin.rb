# frozen_string_literal: true

Trestle.resource(:shows) do
  menu do
    item :shows, icon: 'fa fa-star'
  end

  search do |query|
    if query
      Show.where('name ILIKE ?', "%#{query}%")
    else
      Show.all
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  form do |_show|
    text_field :name
    text_field :description
    text_field :year_written
    text_field :rights_holder
    check_box :public_domain
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |show|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:show).permit(:name, ...)
  # end
end
