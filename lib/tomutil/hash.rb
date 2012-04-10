
module TomUtil
class Hash
  def subset keys
    self.map {|k, v| hash[k] = v if keys.include?(k)}
  end
end
  
class HashComparer
  attr_reader :left_extra, :left_missing
  attr_reader :right_extra, :right_missing
  attr_reader :diffs
  
  def initialize h1, h2
    @left_extra = @right_missing = h1.keys - h2.keys
    @right_extra = @left_missing = h2.keys - h1.keys
    @diffs = (h1.keys & h2.keys).select {|k| h1[k] != h2[k]}
  end
end # HashComparer
end # TomUtil

