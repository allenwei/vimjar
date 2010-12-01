require 'background_process'

module Aruba
  class Process
    def initialize(cmd, timeout)
      @cmd = cmd
      @timeout = timeout
    end

    def run!(&block)
      @process = BackgroundProcess.run(@cmd)
      yield self if block_given?
    end

    def stdin
      @process.stdin
    end

    def output
      stdout + stderr
    end

    def stdout
      if @process
        @stdout ||= @process.stdout.read
      else
        ''
      end
    end

    def stderr
      if @process
        @stderr ||= @process.stderr.read
      else
        ''
      end
    end

    def stop
      if @process
        status = @process.wait(@timeout)
        status && status.exitstatus
      end
    end
  end
end
