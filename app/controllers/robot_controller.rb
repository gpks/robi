class RobotController < ApplicationController

  before_action :set_robi
  before_action :authenticate_user!, except: [:index]
 
  def index
    begin
    @proxi = @robi.proximity
  rescue Exception => e
    flash[:alert] = "Ojej... Robot poza naszym zasięgiem "
  end
    
  end

  def lock
    if @robi.lock != "OK"
      flash[:alert] = "Ktoś już używa tego robota!!"
    else
      @credit = current_user.credits.create(credits: false)
    end 

    redirect_to robot_index_path
  end

  def forward
    @robi.forward
    redirect_to robot_index_path
  end

  def backward
    @robi.backward
    redirect_to robot_index_path  
  end

  def slow_forward
    @robi.slow_forward
    redirect_to robot_index_path  
  end

  def slow_backward
    @robi.slow_backward
    redirect_to robot_index_path  
  end

  def left
    @robi.left
    redirect_to robot_index_path  
  end

  def right
    @robi.right
    redirect_to robot_index_path  
  end

  def run
    @robi.run
    redirect_to robot_index_path  
  end

  def attack
    @robi.attack
    redirect_to robot_index_path  
  end

end
private

def set_robi
  @robi=Robi.new
end
