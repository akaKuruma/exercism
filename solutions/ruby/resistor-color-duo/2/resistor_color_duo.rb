class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(arr)
    (0..1).map { |i| COLORS.index(arr[i]).to_s}.join().to_i
  end
end