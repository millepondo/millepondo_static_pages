module MillepondoStaticPages
  module Hooks
    class ViewHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context)
        bdata = ""
        bdata += stylesheet_link_tag('static_pages',{ :plugin => :millepondo_static_pages})
        return bdata
      end
    end
  end
end