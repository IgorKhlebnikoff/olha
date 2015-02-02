CONF = {}

sn = YAML.load_file(Rails.root + 'config/global_settings.yml')
sn.each do |zero_level_key, zero_level_value|
  if zero_level_key == 'environments'
    CONF.merge!(zero_level_value[Rails.env])
  else
    zero_level_value.each do |first_level_key, first_level_value|
      CONF.merge!({ first_level_key =>  first_level_value })
    end
  end
end
