class Chart
  include ActiveModel::Model
  attr_accessor :from_time, :from_date, :to_time, :to_date, :user

  @@cache = {}

  def entries
    return @@cache[cache_key] if @@cache[cache_key].present?

    @@cache[cache_key] = Lastfm::Chart.new(
      from: from,
      to: to,
      user: user
    ).get
    @@cache[cache_key]
  end

  private

  def cache_key
    "#{from.to_i}_#{to.to_i}_#{user}".parameterize
  end

  def from
    Time.parse("#{from_date} #{from_time}")
  end

  def to
    Time.parse("#{to_date} #{to_time}")
  end
end
