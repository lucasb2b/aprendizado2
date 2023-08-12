class JobScheduler
  def initialize(arr, t)
    @arr = arr
    @t = t
    @n = arr.length
  end

  def print_job_scheduling
    # Sort all jobs according to decreasing order of profit
    @arr.sort! { |a, b| b[2] <=> a[2]}

    # To keep track of free times slots
    result = []

    # To store result (Sequence of jobs)
    job = []
    @t.times do |i|
      job[i] = '-1'
      result[i] = false
    end

    #Iterate through all given jobs
    @n.times do |i|
      # Find a free slot for this job
      # (Note that we start from the last possible slot)
      (@arr[i][1] - 1).downto(0) do |j|
        # Free slot found
        if !result[j]
          result[j] = true
          job[j] = @arr[i][0]
          break
        end
      end
    end

    puts "Following is the maximum profit sequence of jobs:"
    puts job.join(', ')
  end
end

# Driver Code
arr = [
  ['a',2,100],
  ['b',1,19],
  ['c',2,27],
  ['d',1,25],
  ['e',3,15]]

scheduler = JobScheduler.new(arr, 3)
scheduler.print_job_scheduling