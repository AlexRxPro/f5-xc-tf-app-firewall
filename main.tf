

//                                     .8888b oo                                       dP dP
//                                     88   "                                          88 88
// .d8888b. 88d888b. 88d888b.          88aaa  dP 88d888b. .d8888b. dP  dP  dP .d8888b. 88 88
// 88'  `88 88'  `88 88'  `88 88888888 88     88 88'  `88 88ooood8 88  88  88 88'  `88 88 88
// 88.  .88 88.  .88 88.  .88          88     88 88       88.  ... 88.88b.88' 88.  .88 88 88
// `88888P8 88Y888P' 88Y888P'          dP     dP dP       `88888P' 8888P Y8P  `88888P8 dP dP
//          88       88
//          dP       dP Template by alexRxpro - 10/2003
// Template : volterra_app_firewall 
// 


// -- Provider 
resource "volterra_app_firewall" "waf1" {

// -- METADATA 
// --- Name
name                     = "ara-acmecorp-waf1"
// --- Labels = {KeyName = Value}
labels = { 
   label-name = "value"
  }
// --- Namespace
namespace                = var.f5_xc_namespace
// --- Description
description              = "Politique WAF 01"

// --- Enforcement mode 
// --- > One of the arguments from this list "use_loadbalancer_setting = true or blocking=true or monitoring=true" must be set
# use_loadbalancer_setting   = true
# monitoring                 = true
blocking                     = true

// --- Detection Setting 
// --- > One of the arguments from this list "default_detection_settings=true or  detection_settings" must be set

# default_detection_settings = true

detection_settings {
// -- Attack Signatures
  signature_selection_setting {
#     default_attack_type_settings = true   
      attack_type_settings { 
         disabled_attack_types = ["ATTACK_TYPE_AUTHENTICATION_AUTHORIZATION_ATTACKS","ATTACK_TYPE_COMMAND_EXECUTION"]
        }
// -- Signature Selection by Accuracy
#     high_medium_accuracy_signatures=true 
#     only_high_accuracy_signatures=true
	    high_medium_low_accuracy_signatures = true 
    }

// --- Automatic Attack Signautres Tuning
#  disable_suppression=true
enable_suppression= true 

// --- Attack Signature Staging 
// -- disable_staging 
disable_staging=true

// --  or stage_new_signatures
# stage_new_signatures {
#   staging_period = 7
#  }

// -- or stage_new_and_updated_signatures
# stage_new_and_updated_signatures {
#   staging_period = 7
#  }

// --- Threat Campaigns
enable_threat_campaigns = true 
#disable_threat_campaigns=true 

// --- Violations
#default_violation_settings = true

violation_settings {
  disabled_violation_types = ["VIOL_EVASION_BARE_BYTE_DECODING","VIOL_HTTP_PROTOCOL_CONTENT_LENGTH_SHOULD_BE_A_POSITIVE_NUMBER"]
 } 

} // end detection_Setting
// --- Bot Setting
// --- > One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
#default_bot_setting = true
 
// Custom setting and value : REPORT / BLOCK / IGNORE
bot_protection_setting {
  good_bot_action         = "REPORT"
  malicious_bot_action    = "BLOCK"
  suspicious_bot_action   = "IGNORE"
 }

// --- Advanced configuration 

// --- Allowed Response Status Codes 
// One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
allow_all_response_codes = true

#allowed_response_codes { 
#  response_code = [200,201,202,203,204,205,206,300,301,302,303,304,308,307,400,401,403,404,407,429,500,501,502,503]
# }

// --- Mask Sensitive Parameters in Logs
// ---> One of the arguments from this list "disable_anonymization default_anonymization custom_anonymization" must be set
# disable_anonymization  = true

default_anonymization  = true
#custom_anonymization {
#  anonymization_config {
#     query_parameter {
#       query_param_name="query1"
#       }
#   }
#   anonymization_config {
#     http_header {
#       header_name = "header1"
#       }
#   }
#   anonymization_config {
#     cookie {
#       cookie_name="cookie1"
#       }  
#     } 
# }

// --- Blocking Response Page
// --- > One of the arguments from this list "use_default_blocking_page blocking_page" must be set
use_default_blocking_page = true

// --- Blocking_page = "string:///BASE-64-OF-YOUR-CODE-HTML"
// SAMPLE HTML CODE = <title>Request Rejected</title></head><body>The requested URL was rejected. Please consult with your administrator.<br/><br/>Your support ID is: {{request_id}}<br/><br/><a href="javascript:history.back()">[Go Back]</a></body></html>
// SAMPLE BASE64 = PHRpdGxlPlJlcXVlc3QgUmVqZWN0ZWQ8L3RpdGxlPjwvaGVhZD48Ym9keT5UaGUgcmVxdWVzdGVkIFVSTCB3YXMgcmVqZWN0ZWQuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLjxici8+PGJyLz5Zb3VyIHN1cHBvcnQgSUQgaXM6IHt7cmVxdWVzdF9pZH19PGJyLz48YnIvPjxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT48L2JvZHk+PC9odG1sPg==
// /!\ Response body can't exceed 4 KB in size.

#blocking_page {
#  response_code = "OK"
#  blocking_page = "string:///PHRpdGxlPlJlcXVlc3QgUmVqZWN0ZWQ8L3RpdGxlPjwvaGVhZD48Ym9keT5UaGUgcmVxdWVzdGVkIFVSTCB3YXMgcmVqZWN0ZWQuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLjxici8+PGJyLz5Zb3VyIHN1cHBvcnQgSUQgaXM6IHt7cmVxdWVzdF9pZH19PGJyLz48YnIvPjxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT48L2JvZHk+PC9odG1sPg=="
#}
} // end provider 

