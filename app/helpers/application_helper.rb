module ApplicationHelper
  def easy_datetime(datetime)
    if user_signed_in? && !current_user.time_zone.blank?
      datetime = datetime.in_time_zone(current_user.time_zone)
    end
      datetime.strftime("%d-%b-%y %H:%M")
  end
  
end
