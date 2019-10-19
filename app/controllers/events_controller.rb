class EventsController < ApplicationController

  def show
    year = DateTime.now.year
    week = DateTime.now.cweek
    keys = [0, 1].map{ |x| "#{year}-#{week + x}"}.join(",")

    params = {
      feed_type: "provider",
      feed_type_id: "324668",
      keys: keys
    }

    @events = Rails.cache.fetch("goteamup_events_#{keys}", expires_in: 1.hours) do
        response = RestClient.get('https://goteamup.com/event_feed', {params: params})
        json = JSON.parse(response.body)

        json["events"].map do |event|
          {
            name: event["name"],
            description: event["description"],
            start: DateTime.parse(event["start"]),
            url: "https://goteamup.com" + event["url"]
          }
        end
          .select{ |e| e[:start] > DateTime.now.beginning_of_day }
          .group_by{ |e| e[:start].to_date }
    end

    render :show
  end
end
