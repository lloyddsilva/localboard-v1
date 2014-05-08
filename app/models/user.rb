class User < ActiveRecord::Base
  rolify
  has_paper_trail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  after_create :ensure_at_least_one_admin

  def full_name 
      name
  end

  # We never want an app without an admin so let's ensure there is at least one user
    def ensure_at_least_one_admin
      if User.count == 1
        u = User.first
        u.add_role :admin
        u.save!
      end
    end


end
