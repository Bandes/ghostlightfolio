# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def page_number(by: :id, per: 20)
    position = self.class.where("#{by} <= ?", send(by)).count
    (position.to_f / per).ceil
  end
end
