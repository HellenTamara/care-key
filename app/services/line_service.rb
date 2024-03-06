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

  def send_message
    # {
    #   "messages: [
    message = {
      "type": "flex",
      "altText": "This is a Flex Message",
      "contents": {
        "type": "bubble",
        "hero": {
          "type": "image",
          "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_1_cafe.png",
          "size": "full",
          "aspectRatio": "20:13",
          "aspectMode": "cover",
          "action": {
            "type": "uri",
            "uri": "http://linecorp.com/",
          },
        },
        "body": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "text",
              "text": "How's your day?",
              "weight": "bold",
              "size": "xl",
            },
            {
              "type": "box",
              "layout": "vertical",
              "margin": "lg",
              "spacing": "sm",
              "contents": [
                {
                  "type": "box",
                  "layout": "baseline",
                  "spacing": "sm",
                  "contents": [
                    {
                      "type": "text",
                      "text": "Don't forget to track your habit!",
                      "wrap": true,
                      "color": "#666666",
                      "size": "sm",
                      "flex": 5,
                    },
                  ],
                },
              ],
            },
          ],
        },
        "footer": {
          "type": "box",
          "layout": "vertical",
          "spacing": "sm",
          "contents": [
            {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "uri",
                "label": "Track your habit",
                "uri": "https://care-key-3e477239e95c.herokuapp.com/",
              },
            },
            {
              "type": "box",
              "layout": "vertical",
              "contents": [],
              "margin": "sm",
            },
          ],
          "flex": 0,
        },
      },
    }
    #   ],
    # }
    p message
    p @id

    p client.push_message(@id, message)
  end
end
