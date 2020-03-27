class Skc < ActiveRecord::Base
  def self.current
    Thread.current[:skc]
  end
  def self.current=(skc)
    Thread.current[:skc] = skc
  end
end
