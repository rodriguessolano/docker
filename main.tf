# FOLDERS

# Top-level folder under an organization.
resource "google_folder" "producao" {
  display_name = "Produção"
  parent       = "organizations/655138358319"
}
# Top-level folder under an organization.
resource "google_folder" "desenvovimento" {
  display_name = "Desenvovimento"
  parent       = "organizations/655138358319"
}
# Top-level folder under an organization.
resource "google_folder" "shared_services" {
  display_name = "Shared_Services"
  parent       = "organizations/655138358319"
}

# Folder nested under another folder.
resource "google_folder" "Network" {
  display_name = "Network"
  parent       = google_folder.shared_services.name
}

# Folder nested under another folder.
resource "google_folder" "monitoring" {
  display_name = "Monitoring"
  parent       = google_folder.shared_services.name
}

# Project Create
resource "google_project" "monitoring" {
  name       = "monitoring"
  project_id = "monitoringteste"
  folder_id  = google_folder.monitoring.name  
}

