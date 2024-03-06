require "json"
require "line/bot"

class LineService
  def initialize(id)
    @id = id
  end

  def client
    p ENV["LINE_SECRET"], ENV["LINE_TOKEN"]
    p @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_SECRET"]
      config.channel_token = ENV["LINE_TOKEN"]
    }
  end

  def send_sticker
    sticker = {
      type: "sticker",
      packageId: "11537",
      stickerId: "52002764",
    }
    p sticker
    p @id
    p client.push_message(@id, sticker)
  end

  def send_alert
    alert = {
      type: "text",
      text: "Your reminder has been set!",
    }
    #   ],
    # }
    p alert
    p @id

    p client.push_message(@id, alert)
  end

  def send_message
    message = {
      "type": "flex",
      "altText": "Don't break your streak!",
      "contents": {
        "type": "bubble",
        "size": "hecto",
        "direction": "ltr",
        "header": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "text",
              "color": "#ffffff",
              "align": "start",
              "size": "lg",
              "gravity": "center",
              "text": "Don't break your streak!",
            },
            {
              "type": "text",
              "text": "99%",
              "color": "#ffffff",
              "align": "start",
              "size": "xs",
              "gravity": "center",
              "margin": "lg",
            },
            {
              "type": "box",
              "layout": "vertical",
              "contents": [
                {
                  "type": "box",
                  "layout": "vertical",
                  "contents": [
                    {
                      "type": "filler",
                    },
                  ],
                  "width": "99%",
                  "backgroundColor": "#0D8186",
                  "height": "6px",
                },
              ],
              "backgroundColor": "#9FD8E36E",
              "height": "6px",
              "margin": "sm",
            },
          ],
          "backgroundColor": "#27ACB2",
          "paddingTop": "19px",
          "paddingAll": "12px",
          "paddingBottom": "16px",
          "justifyContent": "center",
        },
        "body": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "box",
              "layout": "vertical",
              "contents": [
                {
                  "type": "text",
                  "color": "#8C8C8C",
                  "size": "md",
                  "wrap": true,
                  "text": "Almost 30 days streak!",
                },
                {
                  "type": "text",
                  "text": "Click to get your reward",
                  "size": "sm",
                },
              ],
              "flex": 1,
              "justifyContent": "center",
              "alignItems": "center",
            },
          ],
          "spacing": "lg",
          "paddingAll": "12px",
          "height": "55px",
        },
        "footer": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "button",
              "action": {
                "type": "uri",
                "uri": "https://care-key-3e477239e95c.herokuapp.com/",
                "label": "Open App",
              },
            },
          ],
        },
        "styles": {
          "body": {
            "separatorColor": "#0000FF",
          },
        },
      },
    }
    p message
    p @id

    p client.push_message(@id, message)
  end
end
