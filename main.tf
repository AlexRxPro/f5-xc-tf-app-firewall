


resource "volterra_app_firewall" "waf1" {
  name                     = "ara-acmecorp-waf1"
  namespace                = var.f5_xc_namespace
  description              = "Politique WAF 01"
  // One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
  allow_all_response_codes = true

  // One of the arguments from this list "disable_anonymization default_anonymization custom_anonymization" must be set
  default_anonymization     = true

  // One of the arguments from this list "use_default_blocking_page blocking_page" must be set
  use_default_blocking_page = true

  // One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
  #default_bot_setting = true-
   bot_protection_setting {
    good_bot_action         = "REPORT"
    malicious_bot_action    = "BLOCK"
    suspicious_bot_action   = "REPORT"
   }

  // One of the arguments from this list "default_detection_settings detection_settings" must be set
  #default_detection_settings = true
  detection_settings {
    default_violation_settings = true
    disable_staging            = true
    enable_threat_campaigns    = true
    
  }
  // One of the arguments from this list "use_loadbalancer_setting blocking monitoring" must be set
  blocking                     = true
}



resource "volterra_app_firewall" "waf2" {
  name                     = "ara-acmecorp-waf2"
  namespace                = var.f5_xc_namespace
  description              = "Politique WAF 02"
  // One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
  allow_all_response_codes = true

  // One of the arguments from this list "disable_anonymization default_anonymization custom_anonymization" must be set
  default_anonymization     = true

  // One of the arguments from this list "use_default_blocking_page blocking_page" must be set
  use_default_blocking_page = true

  // One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
  #default_bot_setting = true
   bot_protection_setting {
    good_bot_action         = "REPORT"
    malicious_bot_action    = "BLOCK"
    suspicious_bot_action   = "REPORT"
   }

  // One of the arguments from this list "default_detection_settings detection_settings" must be set
  #default_detection_settings = true
  detection_settings {
    default_violation_settings = true
    disable_staging            = true
    enable_threat_campaigns    = true
    
  }
  // One of the arguments from this list "use_loadbalancer_setting blocking monitoring" must be set
  blocking                     = true
}



resource "volterra_app_firewall" "waf3" {
  name                     = "ara-acmecorp-waf3"
  namespace                = var.f5_xc_namespace
  description              = "Politique WAF 03"
  // One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
  allow_all_response_codes = true

  // One of the arguments from this list "disable_anonymization default_anonymization custom_anonymization" must be set
  default_anonymization     = true

  // One of the arguments from this list "use_default_blocking_page blocking_page" must be set
  use_default_blocking_page = true

  // One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
  #default_bot_setting = true
   bot_protection_setting {
    good_bot_action         = "REPORT"
    malicious_bot_action    = "BLOCK"
    suspicious_bot_action   = "REPORT"
   }

  // One of the arguments from this list "default_detection_settings detection_settings" must be set
  #default_detection_settings = true
  detection_settings {
    default_violation_settings = true
    disable_staging            = true
    enable_threat_campaigns    = true
    
  }
  // One of the arguments from this list "use_loadbalancer_setting blocking monitoring" must be set
  blocking                     = true
}