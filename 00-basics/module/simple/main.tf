module "msg" {
  source = "../modules/echo"
  message = "Repita  mensagem, pf"
}

output "echo" {
  value = module.msg.echo
}
