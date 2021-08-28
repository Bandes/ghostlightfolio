class ShowXlsxGenerator

  attr_reader :show

  def initialize(show:)
    @show = show
  end

  def act_columns
    sorted_acts_and_scenes.map(&:name).prepend('Roles')
  end

  def role_act_chart_data
    rows = []
    roles.each do |role|
      rows << row_for(role: role)
    end
    rows
  end

  private

  def acts
    @acts ||= show.acts.order(:name)
  end

  def roles
    @roles ||= show.roles.order(:name)
  end

  def sorted_acts_and_scenes
    columns = []
    acts.each do |act|
      columns << act
      act.scenes.order(:name).each do |scene|
        columns << scene
        scene.french_scenes.order(:name).each do |french_scene|
          columns << french_scene
        end
      end
    end
    columns
  end

  def row_for(role:)
    row = []
    sorted_acts_and_scenes.each_with_index do |scene, index|
      if scene.roles.include? role
        row[index] = 'X'
      else
        row[index] = nil
      end
    end
    row.prepend role.name
  end

end
