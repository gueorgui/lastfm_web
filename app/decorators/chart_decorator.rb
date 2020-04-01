class ChartDecorator < SimpleDelegator
  def entries
    super.map do |entry|
      EntryDecorator.new(entry, max_play_count)
    end
  end

  def max_play_count
    __getobj__.entries.max_by(&:play_count).play_count
  end
end
