class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def show_errors
    errors.full_messages.to_sentence
  end
end
