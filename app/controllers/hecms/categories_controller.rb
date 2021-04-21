# frozen_string_literal: true

require_dependency 'hecms/base_controller'

module Hecms
  class CategoriesController < BaseController
    before_action :find_category, only: %i[destroy edit update]

    def index
      @categories = Category.roots.page(params[:page])
    end

    def new
      @category = Category.new
    end

    def edit; end

    def update
      if @category.update(form_params)
        flash[:notice] = t('common.update_success')
        redirect_to(categories_path)
      else
        flash[:alert] = t('common.update_fail')
        render(:edit)
      end
    end

    def create
      @category = Category.new(form_params)

      if @category.save
        flash[:notice] = t('common.create_success')
        redirect_to(categories_path)
      else
        flash[:alert] = t('common.create_fail')
        render(:new)
      end
    end

    def destroy
      if @category.destroy
        flash[:notice] = t('common.delete_success')
        redirect_to(adm_categories_path)
      else
        flash[:alert] = t('common.delete_fail')
        redirect_to(adm_categories_path)
      end
    end

    private

    def find_category
      @category = Category.friendly.find(params[:id])
    end

    def set_ui
      super
      @ui_main_nav_active_categories = 'active'
    end

    def form_params
      params.require(:category).permit(
        :name,
        :parent_id,
        :pinyin,
        :seo_title,
        :keywords,
        :description,
        :enabled,
        :slug
      )
    end
  end
end
