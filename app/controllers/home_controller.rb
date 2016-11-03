class HomeController < ApplicationController
  def index
    text =
      if table_found && job_run
        'success'
      else
        [
          table_found ? nil : 'table not found',
          job_run ? nil : 'job not run',
        ].compact.join(', ')
      end

    render text: text
  end

  private

  def table_found
    Job.connection.execute('show tables').include?(['jobs'])
  end

  def job_run
    job = Job.create
    TestJob.perform_later(job.id)
    begin
      Timeout.timeout(5) do
        until job.reload.completed
        end
      end
      job.completed
    rescue Timeout::Error
      false
    end
  end
end
