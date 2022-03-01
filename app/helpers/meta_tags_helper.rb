# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags  # rubocop:disable Metrics/MethodLength
    {
      site: 'Chiikoma',
      reverse: true,
      separator: '|',
      description: '「小さな困りごと」気にしてあげませんか？',
      canonical: 'https://chiikoma.herokuapp.com/',
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') }
      ],
      og: {
        site_name: 'Chiikoma',
        title: 'ちいこま',
        description: '「小さな困りごと」気にしてあげませんか？',
        type: 'website',
        url: 'https://chiikoma.herokuapp.com/',
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@takapi61'
      }
    }
  end
end
