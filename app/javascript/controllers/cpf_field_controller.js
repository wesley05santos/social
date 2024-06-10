import { Controller } from "@hotwired/stimulus"
// import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "preview" ]
  //static debounces = [
  //  {
  //    name: 'fetch_input',
  //    wait: 2000
  //  }
  //]

  connect() {
    //useDebounce(this)
  }

  fetch_input(event){
    this.previewTarget.textContent = this.handle_input(event.target.value)
    const isCpfValid = this.validateCpf(event.target.value)
    if (!isCpfValid) this.previewTarget.textContent = 'CPF INVÁLIDO'
  }

  handle_input(text){
    if(text.length >= 3){ text = this.inject_char(3, '.', text) }
    if(text.length >= 7){ text = this.inject_char(7, '.', text) }
    if(text.length >= 11){ text = this.inject_char(11, '-', text) }
    return text
  }

  inject_char(position, char, text){
    let textTmp = text.split('')
    textTmp.splice(position,0, char)
    return textTmp.join('')
  }

  validateCpf(cpf){
    let Soma = 0
    let Resto

    let strCPF = String(cpf).replace(/[^\d]/g, '')

    if (strCPF.length !== 11)
      return false

    if ([
      '00000000000',
      '11111111111',
      '22222222222',
      '33333333333',
      '44444444444',
      '55555555555',
      '66666666666',
      '77777777777',
      '88888888888',
      '99999999999',
      ].indexOf(strCPF) !== -1)
      return false

    for (let i=1; i<=9; i++)
      Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);

    Resto = (Soma * 10) % 11

    if ((Resto == 10) || (Resto == 11))
      Resto = 0

    if (Resto != parseInt(strCPF.substring(9, 10)) )
      return false

    Soma = 0

    for (let i = 1; i <= 10; i++)
      Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i)

    Resto = (Soma * 10) % 11

    if ((Resto == 10) || (Resto == 11))
      Resto = 0

    if (Resto != parseInt(strCPF.substring(10, 11) ) )
      return false

    return true
  }
}
