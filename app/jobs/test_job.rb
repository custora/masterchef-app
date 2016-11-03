class TestJob < ApplicationJob
  def perform(job_id)
    Job.find(job_id).update_attribute(:completed, true)
  end
end
