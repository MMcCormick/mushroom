require 'csv'

task :import_fungus_data, [] => [:environment] do
  Fungus.transaction do 
    cap_shape_hash = {'b' => 'bell', 'c' => 'conical', 'x' => 'convex', 'f' => 'flat', 'k' => 'knobbed', 's' => 'sunken'}
    
    CSV.foreach('tmp/agaricus-lepiota.data') do |csv|
      f = Fungus.new
      if csv[0] == 'e'
        f.edible = 'edible'
      elsif csv[0] == 'p'
        f.edible = 'poisonous'
      end

      f.cap_shape = cap_shape_hash[csv[1]]

      f.cap_surface  = csv[2]
      f.cap_color = csv[3]
      f.bruises = csv[4]
      f.odor = csv[5]
      f.gill_attachment = csv[6]
      f.gill_spacing = csv[7]
      f.gill_size = csv[8]
      f.gill_color = csv[9]
      f.stalk_shape = csv[10]
      f.stalk_root = csv[11]
      f.stalk_surface_above_ring = csv[12]
      f.stalk_surface_below_ring = csv[13]
      f.stalk_color_above_ring = csv[14]
      f.stalk_color_below_ring = csv[15]
      f.veil_type = csv[16]
      f.veil_color = csv[17]
      f.ring_number = csv[18]
      f.ring_type = csv[19]
      f.spore_print_color = csv[20]
      f.population = csv[21]
      f.habitat = csv[22]

      f.save!
    end
  end
end
