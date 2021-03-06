CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'achieve-dive-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-dive-production'
    when 'development'
      config.fog_directory = 'achieve-dive-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-dive-development'
  end
  #testなどの環境も作成したい場合、バケットをさらに作成し、when文を、以下の用に追加する
  #when 'test'
    #config.fog_directory = 'テスト環境用のバケット名'
    #config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/テスト環境用のバケット名'
end
