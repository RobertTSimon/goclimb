class Trip < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :state, inclusion: { in: ['next', 'done'] }
  belongs_to :user
  has_many :route_trips
  has_many :joint_user_trips
  has_many :routes, through: :route_trips
  has_many :joint_user_trips, dependent: :destroy

  after_update :ensure_next_trip

  def ensure_next_trip
    if user.next_trip.nil?
      Trip.create(
        user: user,
        state: "next",
        start_date: Date.today + 1.month,
        end_date: Date.today + 1.month + 1.day
      )
    end
  end
end

