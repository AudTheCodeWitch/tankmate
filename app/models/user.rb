class User < ApplicationRecord
  has_many :tanks
  has_many :maintenances, through: :tanks
  has_many :tasks, through: :maintenances

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def gallons
    gallons = 0
    tanks.each do |t|
      gallons += t.size
    end
    gallons
  end

  def fish_count
    fish_count = 0
    tanks.each do |t|
      fish_count += t.fish.count
    end
    fish_count
  end

  def plants_count
    plants_count = 0
    tanks.each do |t|
      plants_count += t.plants.count
    end
    plants_count
  end

  def completed_tasks_count
    completed_tasks = 0
    maintenances.each do |m|
      completed_tasks += 1 if m.complete
    end
    completed_tasks
  end

  def incomplete_tasks_count
    incomplete_tasks = 0
    maintenances.each do |m|
      incomplete_tasks += 1 unless m.complete
    end
    incomplete_tasks
  end


end
