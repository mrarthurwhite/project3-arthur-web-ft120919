module EventsHelper
  def meeting_time(event)
    # https://apidock.com/ruby/DateTime/strftime
    event.meeting_datetime.strftime('%m/%d/%y at %l:%M  %p') if event.meeting_datetime
  end

end
