# frozen_string_literal: true

require_dependency 'hecms/base_controller'

module Hecms
  class ArticlesController < BaseController
    before_action :find_article, only: %i[edit update show destroy]

    def index
      @articles = Article.keyword_like(params[:keyword]).includes(:tags, :categories).page(params[:page])
    end

    def search
      @articles = Article.keyword_like(params[:keyword]).includes(:tags, :categories).page(params[:page])
    end

    def new
      # binding.pry

      @article = Article.new
    end

    def edit; end

    def update
      if @article.update(form_params)
        flash[:notice] = t('common.update_success')
        redirect_to(adm_articles_path)
      else
        flash[:alert] = t('common.update_fail')
        render(:new)
      end
    end

    def create
      @article = Article.new(form_params)
      if @article.save
        flash[:notice] = t('common.create_success')
        redirect_to(adm_articles_path)
      else
        flash[:alert] = t('common.create_fail')
        render(:new)
      end
    end

    def destroy
      respond_to do |format|
        if @article.destroy
          format.html { redirect_to adm_articles_path }
          format.json { render json: { code: 1111, id: @article.id } }
        else
          format.html { redirect_to adm_articles_path }
          format.json { render json: { code: 0o000, id: nil } }
        end
      end
    end

    private

    def find_article
      @article = Article.find(params[:id])
    end

    def set_ui
      super
      @ui_main_nav_active_articles = 'active'
    end

    def form_params
      params.require(:article).permit(
        :image,
        :title,
        :seo_title,
        :keywords,
        :description,
        :content_html,
        :sort,
        :published_date,
        :top,
        :editer_id,
        :scheduled,
        category_ids: [],
        tag_ids: []
      )
    end
  end
end
