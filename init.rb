require 'millepondo_static_pages/millepondo_static_pages'

Redmine::Plugin.register :millepondo_static_pages do
  name 'millepondo static pages plugin'
  author 'millepondo services'
  description 'A plugin to manage static pages for imprint and privacy policy'
  version '1.0.0'
  url 'https://gitlab.millepondo.biz/redmine/millepondo_static_pages'
  author_url 'https://www.millepondo.de'

  # redmine requirements
  requires_redmine :version_or_higher => '3.4'

  # settings
  settings :default => {
      'legal'         => {
          :text     => "",
          :position => MillepondoStaticPages::POSITION_NONE
      },
      'privacypolicy' => {
          :text     => "",
          :position => MillepondoStaticPages::POSITION_NONE
      }
  }, :partial       => 'settings/static_pages_settings'

end

if Rails.version < '5'
  ActionDispatch::Callbacks.to_prepare do
    require_dependency 'millepondo_static_pages'
  end
else
  ActiveSupport::Reloader.to_prepare do
    require_dependency 'millepondo_static_pages'
  end
end