# frozen_string_literal: true

Trestle.resource(:users) do
  menu do
    item :users, icon: 'fa fa-star'
  end

  search do |query|
    if query
      User.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%")
    else
      User.all
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do |_user|
    column :first_name
    column :last_name
    column :email
    column :editor
    column :admin
    column :current_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_at
    column :last_sign_in_ip
    column :failed_attempts
    actions
  end

  form do |_user|
    text_field :first_name
    text_field :last_name
    check_box :editor
    check_box :admin
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
