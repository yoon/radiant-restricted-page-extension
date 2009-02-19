class RestrictedPage < Page
  class RestrictedTagError < StandardError; end
  
  # We need to process the page every time
  def cache?
    false
  end
  
  def config
    string = render_part(:config)
    unless string.empty?
      YAML::load(string)
    else
      {}
    end
  end
  
  # Page processing. redirect to a different page
  def process(request, response)
    @request, @response = request, response
    
    @ranges = (config['ip_ranges'] || "").split(',')
    @ranges.each {|r|
      range = IPAddr.new(r.strip)
      @ipflag = true if range.include?(IPAddr.new(request.remote_ip))
    }
    
    if @ipflag
      super(request, response)
    else
      response.redirect( config['redirect_to'] )    
    end
    
    @request, @response = nil, nil
  end
end