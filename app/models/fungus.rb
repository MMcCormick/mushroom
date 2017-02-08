class Fungus < ActiveRecord::Base
  validates :edible, inclusion: { in: %w(poisonous edible),
    message: "%{value} is not 'poisonous' or 'edible'" }
  validates :cap_shape, inclusion: { in: %w(bell conical convex flat knobbed sunken),
    message: "%{value} is not 'bell', 'conical', 'convex', 'flat', 'knobbed', or 'sunken'" }

  def self.valid_cap_shape_hash
    {'b' => 'bell', 'c' => 'conical', 'x' => 'convex', 'f' => 'flat', 'k' => 'knobbed', 's' => 'sunken'}
  end
end
