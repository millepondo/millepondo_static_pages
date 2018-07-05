class StaticController < ApplicationController
  unloadable

  def show
    settings = MillepondoStaticPages.settings
    name = params[:name]

    if name.present? && settings.include?(name)
      @title = l(('label_sp_'+name).to_sym)
      @text = settings[name]['text']
    end
    render 'show'
  end

end