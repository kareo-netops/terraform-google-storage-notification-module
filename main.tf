resource "google_storage_notification" "default" {
  # required arguments
  bucket             = var.bucket_name
  payload_format     = var.payload_format
  topic              = var.topic_id


  #optional arguments
  event_types        = var.event_types
  object_name_prefix = var.object_name_prefix
  custom_attributes  = var.custom_attributes
}
