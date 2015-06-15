require "speedup-dashboard/engine"

module SpeedupDashboard

  # array of arrays
  def analyzers
    @analyzer_options ||= []
  end

  def initialize_analyzers!
    @analyzers = @analyzer_options.map{|analyzer| initialize_analyzer(*analyzer) }
  end

  def analyze(request)
    @analyzers.each do |analyzer|
      analyzer.analyze(request)
    end
  end

  private

    def initialize_analyzer(analyzer, *parameters)
      @analyzer = case analyzer
      when Symbol
        analyzer_class_name = analyzer.to_s.camelize
        analyzer_class =
          begin
            require "speedup/analyzers/#{analyzer}"
          rescue LoadError => e
            raise "Could not find analyzer for #{analyzer} (#{e})"
          else
            Speedup::Analyzers.const_get(analyzer_class_name)
          end
        analyzer_class.new(*parameters)
      when :all
        # initialize all
      else
        analyzer
      end

      @analyzer
    end

end
