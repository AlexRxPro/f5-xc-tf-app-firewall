


resource "volterra_app_firewall" "waf1" {

// https://registry.terraform.io/providers/volterraedge/volterra/0.11.26/docs/resources/volterra_app_firewall
// https://github.com/volterraedge/terraform-provider-volterra/blob/main/volterra/resource_auto_volterra_app_firewall.go


// ### METADATA 
  name                     = "ara-acmecorp-waf1"
   // INFO : labels = {KeyName = Value}
  labels = { 
             label-name = "value"
           }
  namespace                = var.f5_xc_namespace
  description              = "Politique WAF 01"

// ### ENFORCEMENT Mode 
  // INFO : One of the arguments from this list "use_loadbalancer_setting = true or blocking=true or monitoring=true" must be set
  blocking                     = true


// ### Detection Setting 
  // One of the arguments from this list "default_detection_settings detection_settings" must be set
  #default_detection_settings = true
  detection_settings {

  // Attack Signatures
    signature_selection_setting {
      attack_type_settings { // or default_attack_type_settings = true 
                              disabled_attack_types = ["ATTACK_TYPE_AUTHENTICATION_AUTHORIZATION_ATTACKS","ATTACK_TYPE_COMMAND_EXECUTION"]
                           }
      // Signature Selection by Accuracy
	    high_medium_low_accuracy_signatures = true // high_medium_accuracy_signatures=true or only_high_accuracy_signatures=true
    }

   // Automatic Attack Signautres Tuning
   enable_suppression= true // or disable_suppression=true

  // Attack Signature Staging
  // - disable_staging 
   disable_staging=true

  // - stage_new_signatures
  // stage_new_signatures {
  //   staging_period = 7
  // }

  // - stage_new_and_updated_signatures
  // stage_new_and_updated_signatures {
  //  staging_period = 7
  // }

// Threat Campaigns
enable_threat_campaigns = true // or disable_threat_campaigns=true 

// Violations
// default_violation_settings = true

violation_settings {
    disabled_violation_types = ["VIOL_EVASION_BARE_BYTE_DECODING","VIOL_HTTP_PROTOCOL_CONTENT_LENGTH_SHOULD_BE_A_POSITIVE_NUMBER"]

}


  // One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
  //  default_bot_setting = true
  // Custom value : REPORT / BLOCK / IGNORE
   bot_protection_setting {
    good_bot_action         = "REPORT"
    malicious_bot_action    = "BLOCK"
    suspicious_bot_action   = "IGNORE"
   }

  // One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
  allow_all_response_codes = true

  // One of the arguments from this list "disable_anonymization default_anonymization custom_anonymization" must be set
  default_anonymization     = true

  // One of the arguments from this list "use_default_blocking_page blocking_page" must be set
  use_default_blocking_page = true

  
  
  
}

