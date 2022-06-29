class LogLineParser
    def initialize(line)
      @line = line
    end

    #Implement the LogLineParser#message method to return a log line's message:
    def message
      @line.split(": ")[1].strip
    end

    #Implement the LogLineParser#log_level method to return a log line's log level, which should be returned in lowercase:
    def log_level
      @line.split("[")[1].split("]")[0].downcase
    end
  
    #Implement the LogLineParser#reformat method that reformats the log line, putting the message first and the log level after it in parentheses:

    def reformat
      "#{message} (#{log_level})"
    end
  end

