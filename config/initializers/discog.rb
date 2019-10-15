# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

DISCOG_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/discogs.yml")[Rails.env]