require "rails_helper"
require "view_component/test_case"

RSpec.describe SimpleModalComponent, type: :component do
  it "renders the expected modal" do
    expect(
      render_inline(described_class.new(button_text: 'Test button', message: 'Test message')).to_html
    ).to eq( <<~HTML
      <label class="btn btn-outline modal-button btn-sm" for="simple-modal">
      Test button
      </label>
      <input class="modal-toggle" id="simple-modal" style="display: none" type="checkbox">
      <div class="modal">
      <div class="modal-box">
      <p>Test message</p>
      <div class="modal-action">
      <label class="btn btn-outline" for="simple-modal">
      Accept
      </label>
      </div>
      </div>
      </div>
    HTML
    )
  end
end
