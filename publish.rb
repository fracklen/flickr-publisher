require 'flickraw'
require 'dotenv'
require 'irb'

Dotenv.load

require './login'
require './synced_photos'
require './target_photo_set'
require './console'
require './publisher'

puts "Fetching autosynced photos"
source = SyncedPhotos.new("fracklen").auto_sync
target = TargetPhotoSet.new("fracklen", "Familie").target

Publisher.new(source, target).publish_all

#IRB.start_session(binding)
