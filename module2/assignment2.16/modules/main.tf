# sns messaging modules

resource "aws_sns_topic" "cart_topic" {
  name = "${var.cart}-sns-topic"
}

resource "aws_sns_topic" "alert_topic" {
  name = "${var.alert}-sns-topic"
}