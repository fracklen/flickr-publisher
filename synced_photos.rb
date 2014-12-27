require 'flickraw'

class SyncedPhotos
  PHOTO_SET = "Auto Sync"

  def initialize(username)
    @username = username
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

  def auto_sync
    @auto_sync ||= photo_sets.select do |photo_set|
      photo_set['title'] == PHOTO_SET
    end.first
  end
end
