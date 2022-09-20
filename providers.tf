terraform {
  cloud {
    organization = "code4romania"

    workspaces {
      tags = [
        "paul",
        "azure",
      ]
    }
  }
}
