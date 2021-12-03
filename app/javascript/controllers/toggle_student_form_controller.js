import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "studentForm" ]

  toggle(event){
    if (this.studentFormTarget.classList.contains('d-none')){
      this.studentFormTarget.classList.remove('d-none')
    } else {
      this.studentFormTarget.classList.add('d-none')
    }
  }
}
