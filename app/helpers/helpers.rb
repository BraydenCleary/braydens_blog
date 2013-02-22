helpers do 
  def calculate_time_difference(seconds)
    if seconds < 60
      "Updated #{seconds.to_i} seconds ago"
    elsif 60 <= seconds && seconds < 3600
      "Updated #{seconds.to_i/60} minutes ago"
    elsif 3600 <= seconds && seconds < 86400
      "Updated #{seconds.to_i/60/60} hours ago"
    eslif 86400 <= seconds && seconds < 604800
      "Updated #{seconds.to_i/60/60/60} days ago"
    end
  end
end
#   elsif 1 < seconds/60 && seconds/60 < 60
#     return "#{seconds/60} minutes ago"
#   elsif 60 <= seconds/60 < 1440
#     return "#{seconds/60/60} hours ago"
#   end
# end
