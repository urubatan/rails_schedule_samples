class MySampleScheduler
	@@scheduler = Rufus::Scheduler::PlainScheduler.start_new
	def self.update_schedules
		@@scheduler.in '1m' do #delay initialization because of problems acessing rails models during rails initialization
			jobs = @@scheduler.cron_jobs
			tasks = SampleTask.all
			tasks.each do |task|
				job = jobs[task.job_id] if task.job_id
				job.unschedule if job && (task.done || job.cron_line!=task.cron)
				if !task.done
					schedule(task)
				end
			end
		end
	end
	def self.unschedule(job_id)
		@@scheduler.unschedule(job_id)
	end
	def self.schedule(task_id)
		task = SampleTask.find task_id
		job = @@scheduler.cron task.cron do |j|
			task = SampleTask.find task_id
			if task
				puts "#{task.name} executing at #{Time.now} ---- #{task.times}"
				task.times = task.times - 1
				task.done = task.times==0
				task.save
				unschedule task.job_id if task.done
			else
				puts "Task deleted #{task_id}"
				unschedule j.job_id
			end
		end		
		task.job_id = job.job_id
		task.save
	end
end
