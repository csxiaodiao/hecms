
# frozen_string_literal: true

module I18nDisplayHelper
  extend ActiveSupport::Concern

  def display_created_at
    I18n.l(created_at, format: :long) if created_at.present?
  end

  def display_md_created_at
    I18n.l(created_at, format: :md) if created_at.present?
  end

  def display_updated_at
    I18n.l(updated_at, format: :long) if updated_at.present?
  end

  def display_deleted_at
    I18n.l(deleted_at, format: :long) if deleted_at.present?
  end

  def display_enabled
    I18n.t(enabled ? "common.bool.true" : "common.bool.false")
  end

  def display_hot
    I18n.t(hot ? "common.bool.true" : "common.bool.false")
  end
end
