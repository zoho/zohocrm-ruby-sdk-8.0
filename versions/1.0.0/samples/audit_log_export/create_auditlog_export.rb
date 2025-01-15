require "ZOHOCRMSDK8_0"

class CreateAuditlogExport
		def self.create_auditlog_export
			audit_log_export_operations =  ZOHOCRMSDK::AuditLogExport::AuditLogExportOperations.new
			request =  ZOHOCRMSDK::AuditLogExport::BodyWrapper.new
			audit_log_export=[]
			audit_log_export1 =  ZOHOCRMSDK::AuditLogExport::AuditLogExport.new
			criteria =  ZOHOCRMSDK::AuditLogExport::Criteria.new
			criteria.comparator="between"
			field=ZOHOCRMSDK::AuditLogExport::Field.new
			field.api_name="audited_time"
			criteria.field = field
			values=[]
			values.push(DateTime.new(2024, 01, 02, 10, 00, 00, "+05:30"))
			values.push(DateTime.new(2024, 01, 03, 10, 00, 00, "+05:30"))
			criteria.value = values
			audit_log_export1.criteria = criteria
			audit_log_export.push(audit_log_export1)
			request.audit_log_export = audit_log_export
			response = audit_log_export_operations.create_auditlog_export(request)
			if response != nil
				print "status Code: " + response.status_code.to_s
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::AuditLogExport::ActionWrapper
						action_wrapper = action_handler
						actionresponses= action_wrapper.audit_log_export
						actionresponses.each do |actionresponse|
							if actionresponse.is_a? ZOHOCRMSDK::AuditLogExport::SuccessResponse
								successresponse = actionresponse
								print "status: " + successresponse.status.value.to_s
								print "code: " + successresponse.code.value.to_s
								print "details: ".to_s
								successresponse.details.each do |k, v|
									print k + ": " + v.to_s
								end
								print "message: " + successresponse.message.to_s
							elsif actionresponse.is_a? ZOHOCRMSDK::AuditLogExport::APIException
								exception = actionresponse
								print "status: " + exception.status.value.to_s
								print "code: " + exception.code.value.to_s
								print "details: ".to_s
								exception.each do |k, v|
									print k + ": " + v.to_s
								end
								print "message: " + exception.message.to_s
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::AuditLogExport::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s
						print "code: " + exception.code.value.to_s
						print "details: ".to_s
						exception.each do |k, v|
							print k + ": " + v.to_s
						end
						print "message: " + exception.message.to_s
					end
				else
          response_object = response.data_object
          response_object.instance_variables.each do |field_1|
            print field_1
            print "\n"
            print response_object.instance_variable_get(field_1)
					end
				end
			end
		end


		def self.initialize_and_call
				begin
					environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
					token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", grant_token: "grant_token")
					ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
					create_auditlog_export
				rescue Exception => e
					raise e
				end
		end
end
CreateAuditlogExport.initialize_and_call