function de {
  env $(cat .env | xargs) $@
}
