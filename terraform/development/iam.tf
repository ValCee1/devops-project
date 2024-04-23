module "iam_users" {
  source   = "../module/iam"
  username = element(var.iam_usernames, count.imndex)
  count    = length(var.iam_usernames)
}

module "iam_group" {
  source     = "../module/iam_group"
  username   = var.iam_usernames
  group_name = "tf_users"
  policy_arn = ""
  depends_on = [module.iam_users]
}
