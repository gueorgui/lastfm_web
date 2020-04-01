class EntryDecorator < SimpleDelegator
  attr_accessor :max_play_count

  def initialize(entry, max_play_count)
    self.max_play_count = max_play_count
    super(entry)
  end

  def display_width
    (play_count / max_play_count.to_f) * 100
  end
end
