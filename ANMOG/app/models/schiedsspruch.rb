class Schiedsspruch < ApplicationRecord
   mount_uploader :attachment,  AttachmentUploader # Tells rails to use this uploader for this model.
   validates :date , presence: true # Make sure the that the date is present.
end
