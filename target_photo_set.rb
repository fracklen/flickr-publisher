require 'flickraw'

class TargetPhotoSet
  def initialize(username, set_name)
    @username = username
    @set_name = set_name
  end

  def user
    @user ||= flickr.people.findByUsername(:username => @username)
  end

  def user_id
    user['id']
  end

  def photo_sets
    @photo_sets ||= flickr.photosets.getList(user_id: user_id)
  end

  def target
    @target ||= photo_sets.select do |photo_set|
      photo_set['title'] == @set_name
    end.first
  end
end
