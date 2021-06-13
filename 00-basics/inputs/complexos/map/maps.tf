variable "image_id_map" {
    type = map(string)
    default = {
        "us-east-1": "ami-abc123",
        "us-east-2": "ami-def456"
    }
}

output "image_id_map" {
    value = var.image_id_map
}