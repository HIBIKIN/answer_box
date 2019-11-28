module ApplicationHelper

  def default_meta_tags
    {
      site: '募集箱📦',
      title: '募集箱📦',
      reverse: true,

      charset: 'utf-8',
      description: '募集箱は質問をTwitterに投稿し、匿名で回答を募集できるサービスです。フォロワーに聞きたい質問をしてみましょう！質問が画像付きでツイートされます。',
      keywords: '募集,匿名サービス,回答,質問箱',
      canonical: request.original_url,
      separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      # ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_default.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@hiiiiiibi',
      }
    }
  end
end
