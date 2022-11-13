require 'rails_helper'

RSpec.describe Recipe do
  it 'exists' do
    country = 'Thailand'
    attrs = {
            "recipe": {
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "label": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "images": {
                    "THUMBNAIL": {
                        "url": "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIFXlpPNUDw3qLIUnwOH8KIaqtwCyVYpkr3y%2BNTvTlITTAiAM2gQAZdtPHDfl%2Fqsz9iHDsasJKBKEf4CcxkKC%2Bk7hryrVBAid%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMWquUW4qKu6pd4p%2BfKqkEiGS4e41HiYZmUxSenjvztQXBnCDofSxCV9Ni0YMZH9c9ETxV0wPHn72eC1DEiarD3XzdM5alfxo4sdaxz8iBJHWHDE70CaQxutlaIZ0MWq%2BhbYG68438WE7UMpVlUJoyV81ba7Nicl4ZOUGDrxBtmh96AM9%2FBDUuDIz3rhhUv%2FFEoxpzWxp2PomDdf3eNpvJ5MtMbXK1PYTuQB%2FGW4jOCT5RHpWguh7aTWMGxJwGdYjTk6XRuQC8WrCIb5%2FXfTx7WryWkaEEi3NLj5d0K1tFJdm1RHRSgIG06JqcOKlqxVU000w1PMFxb47kaV%2Bgbygy1OlXfUgHO9PBOSa7fdhBMrbXQKjA7pwoHPihsv2ZA%2B0C9KmCw49ONgXJGglULY74G7n1MoYeS2W89Pge2%2FmneJg0%2FTShLQLPCM9IlDwOKUGLAQRpcFQhXL1YBwjjCUjHTzGSzn0cnnFRlWN5Z51pxu8uMczPfh2wmIESt25PRZhsZtNaYqnNu9d32cOu91%2FOOXmXn3ZmW2UGvnQc%2BimlcQ%2BvpqGT1Dl660P2xw3VnVXhjxoDsqN9SWIlhTo7ptesus2sT%2BgzR6cl7jfetqB3wS56QeN3qM0mi1PiZnpTddq3LjgWmfNxzCPWQUN2kGo7sgE09REnmeflVkeFa1vSLF%2Bd02y7%2BQ0BOaVZvXYG7ljIWE5%2BZTQqxIXK%2FesAdtziEbCqJfnJ1muUwZU66h%2BIAACS5UMQKe2t1jDvp7ybBjqqAb916gjCS4AehUYitaqTnLB4f5XkWJ%2BXeFI32J50cYBm7dw%2BwXvEGJncxzyFnS%2Bj6O9ennYbl8v2dyOSsK1tNXNoGqMxDGbFKLei6vJe4h5bYjEoF80kUB5tAHFZvXkxUluZWIUuPkQKB1QLOz2ukPw2MEEKMJBGnl76wwFOkI9wXBva%2BwTtc%2FlYICNHRi548CB%2B39tXtpA%2BP6ZvH8PN8kazgpVJuJqUe%2BUD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221112T044227Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHJZA3R2A%2F20221112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=db1110fea4797991b6a824c4b50243a0fcb1452018ca7de6132ff46575b4a313"
                    },
                }
            }
            }

    recipe = Recipe.new(attrs, country)
    expect(recipe).to be_a Recipe
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.country).to eq("Thailand")
  end
  
end