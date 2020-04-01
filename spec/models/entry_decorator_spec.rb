require "rails_helper"

RSpec.describe EntryDecorator do
  describe '.display_width' do
    it 'returns a correct display width' do
      entry = double('entry', { play_count: 20 })
      decorator = EntryDecorator.new(entry, 100)
      expect(decorator.display_width).to eql(20)
    end
  end
end
