require 'rails_helper'

RSpec.describe Country do
  it 'exists' do
    attrs = {
        "name": {
            "common": "Mauritania",
            "official": "Islamic Republic of Mauritania",
            "nativeName": {
                "ara": {
                    "official": "الجمهورية الإسلامية الموريتانية",
                    "common": "موريتانيا"
                }
            }
        },
        "capital": [
            "Nouakchott"
        ],
        "altSpellings": [
            "MR",
            "Islamic Republic of Mauritania",
            "al-Jumhūriyyah al-ʾIslāmiyyah al-Mūrītāniyyah"
        ]
    }

    country = Country.new(attrs)
  end
end