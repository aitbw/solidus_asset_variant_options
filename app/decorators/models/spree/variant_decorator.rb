module Spree
  module VariantDecorator
    def self.prepended(base)
      base.has_many :variant_images, -> { order(:position) }, class_name: '::Spree::VariantImage'
      base.has_many :variant_image_images, through: :variant_images, source: :image

      base.alias_method :images, :variant_image_images
      base.alias_method :images=, :variant_image_images=
    end

    private

    ::Spree::Variant.prepend self
  end
end
