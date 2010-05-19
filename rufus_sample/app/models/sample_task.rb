class SampleTask < ActiveRecord::Base
	after_create :schedule_me
	after_destroy :unschedule_me
	
	def schedule_me
		MySampleScheduler.schedule read_attribute(:id)
	end
	def unschedule_me
		MySampleScheduler.unschedule read_attribute(:job_id)
	end
end
