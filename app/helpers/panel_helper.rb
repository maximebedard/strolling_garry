module PanelHelper

  def panel_for(options = {}, &block)

    options.reverse_merge!({
      :size => 12,
      :type => 'panel-default'
    })

    "
    <div class='row' #{"id='#{options[:id]}'" if !options[:id].nil?}>
      <div class='col-md-#{options[:size]} col-md-offset-#{(12 - options[:size]) / 2}'>
        <div class='panel #{options[:type]}'>
        #{"
        <div class='panel-heading'>
          <h3 class='panel-title'>#{options[:title]}</h3>
        </div>" if !options[:title].nil?}
          #{capture(&block)}
        </div>
      </div>
    </div>
    ".html_safe
  end

  def bootstrap_class_for(type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[type] || type.to_s
  end

  def errors_for(record, options = {})

    return if record.errors.empty?

    "<div class='alert alert-warning alert-dismissible' role='alert'>
      <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>
      <ul>
       #{record.errors.full_messages.collect {|msg| "<li>#{msg}</li>"}.join()}
      </ul>
    </div>".html_safe

  end

   def back_to(url = nil, options = {})
    options.reverse_update({
      class:"btn btn-default"
    })
    link_to "Back", url.nil? ? request.referer : url, options
  end



end
