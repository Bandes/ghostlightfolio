# frozen_string_literal: true

class SimpleModalComponent < ViewComponent::Base
  def initialize(button_text:, message:)
    @button_text = button_text
    @message = message
  end
end
