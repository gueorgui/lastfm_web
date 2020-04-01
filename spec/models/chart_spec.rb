require "rails_helper"

RSpec.describe Chart do
  describe '.entries' do
    it 'gets the lastfm chart' do
      chart = Chart.new(
        from_time: '13:00',
        from_date: '2020-03-31',
        to_time: '13:00',
        to_date: '2020-04-01',
        user: 'bob'
      )
      lastfm_chart = double({ get: nil })
      allow(Lastfm::Chart).to receive(:new).with(
        from: Time.parse('2020-03-31 13:00'),
        to: Time.parse('2020-04-01 13:00'),
        user: 'bob'
      ).and_return(lastfm_chart)

      chart.entries
      expect(lastfm_chart).to have_received(:get)
    end
  end
end
