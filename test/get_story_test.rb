gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'vcr'
require 'webmock'
require './lib/get_story'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

class GetStoryTest < Minitest::Test
  def test_it_gets_list_of_stories
    VCR.use_cassette('test_it_gets_list_of_stories') do
      api = PivotalTrackerAPI.new
      stories = api.get_stories(770577)
      expected = 8
      assert_equal expected, stories.length
    end
  end
end
