module ApplicationHelper
  def credit_count
    current_user.credits.where(:credits => true).count -
      current_user.credits.where(:credits => false).count
  end
end
