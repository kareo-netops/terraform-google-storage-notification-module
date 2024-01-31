variable "bucket_name" {
  description = "name of the bucket to subscribe to"
  type        = string
}

variable "payload_format" {
  description = "the desired content of the payload. Defaults to 'NONE'."
  type        = string
  default     = "NONE"
  validation {
    condition = contains(["NONE", "JSON_API_V1"], var.payload_format)
    error_message = "Values 'NONE' and 'JSON_API_V1' are the only acceptable values."
  }
}

variable "topic_id" {
  description = "The Cloud PubSub topic to which this subscription publishes. Use either the topic name or the project-level name."
  type        = string
}

variable "event_types" {
  description = "List of event type filters for this notification. If not set, Cloud Storage sends notifications for all events. Valid types are 'OBJECT_FINALIZE', 'OBJECT_METADATA_UPDATE', 'OBJECT_DELETE', and 'OBJECT_ARCHIVE'."
  type        = list(string)
}

variable "object_name_prefix" {
  description = "Specify a prefix path filter for this notification."
  type        = string
  default     = ""
}

variable "custom_attributes" {
  description = "Map of custom attributes"
  type        = map
  default     = {}
}
