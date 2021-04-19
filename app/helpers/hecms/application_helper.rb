# frozen_string_literal: true

module Hecms
  module ApplicationHelper
    def controller_path_action_name
      "#{controller.controller_path.gsub('/', '__')}__#{controller.action_name}"
    end

    def html_body_classes
      "#{controller_path_action_name} #{@body_classes&.join(' ')}"
    end

    def site_logo_url
      # SystemConfig.current.site_logo.service_url
      '/'
    end

    def site_name
      'Site Name'
    end

    def seo_title
      'Seo Title'
    end

    def keywords
      'Keywords'
    end

    def description
      'Description'
    end

    def slogan
      'Slogan'
    end

    def media_image_url(media_name)
      media_name = truncate(media_name, length: 7, omission: '')
      string = Base64.urlsafe_encode64(media_name)
      "https://prmedia.oss-cn-shanghai.aliyuncs.com/default_fff.png?x-oss-process=image/resize,w_300,h_300/watermark,image_bG9nb3cucG5nP3gtb3NzLXByb2Nlc3M9aW1hZ2UvcmVzaXplLFBfMTU=,g_nw,x_10,y_10/watermark,text_#{string},color_333333,shadow_50,t_100,g_center/watermark,text_5b6u5YWJ572R5aqS,color_666666,size_13,g_se"
    end

    def ui_right_floated_new_button_class
      'ui right floated basic button'
    end

    def ui_show_button_class
      'ui tiny basic button'
    end

    def ui_edit_button_class
      'ui tiny button'
    end

    def ui_delete_button_class
      'ui tiny inverted red button'
    end

    def ui_restore_button_class
      'ui basic tiny green button'
    end

    def ui_show_table_class
      'ui definition table'
    end

    def display_short_date(x)
      date = x.published_date || x.created_at
      I18n.l(date, format: :yueri)
    end

    def highlight(text)
      text = escape_once(strip_tags(text)).gsub('[h]', '<em>').gsub('[/h]', '</em>').gsub(/\\n|\\r/, '')
      text.html_safe
    end

    def title_tag
      @page_title.present? ? content_tag(:title, "#{site_name}_#{@page_title}") : content_tag(:title, "#{site_name}_#{seo_title}")
    end

    def keywords_tag
      @page_keywords.present? ? @page_keywords : keywords
    end

    def description_tag
      @page_description.present? ? @page_description : description
    end
  end
end
