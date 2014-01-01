require 'faraday'
require 'json'

class PivotalTrackerAPI

  def get_stories(project_id=770577)
    conn = Faraday.new(:url => 'https://www.pivotaltracker.com/services/v5/projects/')
    response = conn.get "#{project_id}/stories" do |request|
      request.headers['X-TrackerToken'] = ENV['PIVOTAL_TRACKER_KEY']
    end
    results = JSON.parse(response.body)
    results
  end

end
