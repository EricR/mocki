require 'json'

def mocki
  yield.to_json
end

class Fixnum
  def records
    times.each_with_index.map {|i| yield i+1}
  end
end
