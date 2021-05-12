# frozen_string_literal: true

require_dependency 'hecms/base_controller'

module Hecms
  class TagsController < BaseController
    before_action :find_tag, only: %i[destroy edit update]

    def index
      @tags = Tag.keyword_like(params[:keyword]).order(id: :desc).page(params[:page])
      # html = render_to_string action: :index, layout: false, formats: [:html]
    end

    def new
      @tag = Tag.new
    end

    def edit; end

    def update
      if @tag.update(form_params)
        flash[:notice] = t('common.update_success')
        redirect_to(tags_path, notice: '更新成功')
      else
        flash[:alert] = t('common.update_fail')
        render(:edit)
      end
    end

    def create
      @tag = Tag.new(form_params)
      if @tag.save
        flash[:notice] = t('common.create_success')
        redirect_to(tags_path)
      else
        flash[:alert] = t('common.create_fail')
        render(:new)
      end
    end

    def destroy
      if @tag.destroy
        flash[:notice] = t('common.delete_success')
        redirect_to(tags_path)
      else
        flash[:alert] = t('common.delete_fail')
        redirect_to(tags_path)
      end
    end

    private

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def set_ui
      super
      @ui_main_nav_active_tags = 'active'
    end

    def form_params
      params.require(:tag).permit(
        :name,
        :pinyin,
        :seo_title,
        :keywords,
        :description,
        :slug
      )
    end
  end
end
