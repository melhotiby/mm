class Notification < ActiveRecord::Base
  attr_accessible :freind_id, :message, :name, :notification_type_id, :user_id
end
