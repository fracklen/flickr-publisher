require 'flickraw'

class Publisher
  def initialize(source, target)
    @source = source
    @target = target
  end

  def publish_all
    success = 0
    puts "Ready to publish #{photos.size} photos"
    photos.each do |photo|
      success += 1 if publish(photo)
    end
    puts "Published #{success} photos"
  end

  def publish(photo)
    flickr.photosets.addPhoto(photoset_id: @target['id'], photo_id: photo['id'])
    puts "Published #{photo['title']}"
    return true
  rescue FlickRaw::FailedResponse => e
    raise e unless e.code == 3
    return false
  end

  def photos
    @photos ||= flickr.photosets.getPhotos(photoset_id: @source['id'])['photo']
  end
end
