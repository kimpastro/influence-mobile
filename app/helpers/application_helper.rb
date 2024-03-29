module ApplicationHelper
  include Pagy::Frontend

  def gender_options_for_select
    Player.genders.map {|k, _| [k.humanize.capitalize, k] }
  end
end
