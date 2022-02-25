# frozen_string_literal: true

module ApplicationHelper
    def default_meta_tags
      {
        site: 'Chiikoma',
        reverse: true,
        separator: '|',
        description: 'ディスクリプション',
        keywords: 'キーワード',
        canonical: 'https://chiikoma.herokuapp.com/',
        noindex: ! Rails.env.production?,
        icon: [
          { href: image_url('favicon.ico') },
          { href: image_url('favicon.ico'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
        ],
        og: {
          site_name: 'Chiikoma',
          title: 'ちいこま',
          description: 'ディスクリプション',
        type: 'website',
        url: 'https://chiikoma.herokuapp.com/',
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@takapi61',
      }
    }
  end
end
