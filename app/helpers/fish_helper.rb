module FishHelper

  def owners_list(fish)
    list = fish.collect do |f|
      f.tank.user
    end
    list.uniq
  end

  def tank_list(owner, fish)
    list = []
    fish.each do |f|
      if f.tank.user_id == owner.id
        list << f.tank
      end
    end
    list.uniq
  end


end
