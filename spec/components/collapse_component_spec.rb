require "rails_helper"
require "view_component/test_case"

RSpec.describe CollapseComponent, type: :component do
  it "renders the collapse component" do
    expect(
      render_inline(described_class.new(title: 'Collapsed', message: 'Message')).to_html
    ).to eq(<<~HTML
    <div class="collapse w-96 border rounded-box border-base-300 collapse-arrow">
    <input type="checkbox">
    <div class="collapse-title text-xl font-medium">
    Collapsed
    </div>
    <div class="collapse-content">
    Message
    </div>
    </div>
    HTML
    )
  end
end
