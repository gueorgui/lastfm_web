require "rails_helper"

RSpec.describe ChartDecorator do
  describe '.max_play_count' do
    it 'gets the maximum play count from all entries' do
      chart = double('chart', {
                       entries: [
                         double('entry', play_count: 2),
                         double('entry', play_count: 3),
                         double('entry', play_count: 5)
                       ]
                     })
      decorator = ChartDecorator.new(chart)
      expect(decorator.max_play_count).to eq(5)
    end
  end

  describe '.entries' do
    it 'decorates the entries' do
      entry = double('entry', play_count: 3)
      chart = double('chart', {
                       entries: [ entry ]
                     })
      allow(EntryDecorator).to receive(:new)
      decorator = ChartDecorator.new(chart)
      decorator.entries
      expect(EntryDecorator).to have_received(:new).with(entry, 3)
    end
  end
end
